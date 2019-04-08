for line in `awk '{print $3}' $csv_path`
do
	echo "开始根据订单号查找文件，订单号为:"$line
	for i in {0..23}
	do
		echo "开始查到日志文件"${log_path[$i]}
		value=$(grep $line ${log_path[$i]} | grep 'ybscall.lua' | grep -Eo '\[.*\]')
		if test ! -z "$value" ;then
			#echo "查到了，在文件"${log_path[$i]}"中"
			log_key=${value:16:8}
			# 判断发送请求的时间和返回结果的时间
			result=$(grep $log_key ${log_path[$i]} | grep -E "ybscall.lua, 370|tools.lua, 256")
			push_time=${result:1:8}
			return_time=${result:643:8}
			return_word=${result:687:96}
			echo "异步推送时间为:"$push_time
			echo "异步返回时间为:"$return_time
			echo "异步返回的结果为:"$return_word
			# 退出第一层循环
			success_write_log=$line","$push_time","$return_time","$return_word
			echo $success_write_log >> $success_trade
			break 1
		else
			echo "没有查到，进行下一个文件的查找"
			if test "$i" -eq "23" ;then
				echo "没有找到推送消息"
				start_trade=$(grep $line ${log_path[$i]})
				start_trade_time=${start_trade:1:8}
				echo "交易开始时间"$start_trade_time
				write_log=$line","$start_trade_time
				echo $write_log >> $fail_trade
			else
				continue
			fi
		fi
	done
	done
