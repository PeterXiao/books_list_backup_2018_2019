set -e

FILES=('arialbd.ttf'
       'arialbi.ttf'
       'ariali.ttf'
       'arial.ttf'
       'courbd.ttf'
       'courbi.ttf'
       'couri.ttf'
       'cour.ttf'
       'simfang.ttf'
       'simhei.ttf'
       'simkai.ttf'
       'SIMLI.TTF'
       'simsunb.ttf'
       'simsun.ttc'
       'SIMYOU.TTF'
       'STFANGSO.TTF'
       'STXINGKA.TTF'
       'timesbd.ttf'
       'timesbi.ttf'
       'timesi.ttf'
       'times.ttf')
LOCAL_FONTS_PATH=~/'.local/share/fonts/windows/'

read -p 'Path for Windows partition (C:): ' c_path
echo 'Copying font files...'
mkdir -p "${LOCAL_FONTS_PATH}"
for file in "${FILES[@]}"; do
    cp -v "${c_path}/Windows/Fonts/${file}" "${LOCAL_FONTS_PATH}"
done

echo 'Rebuilding font cache...'
cd "${LOCAL_FONTS_PATH}"
mkfontdir
mkfontscale
fc-cache -f
