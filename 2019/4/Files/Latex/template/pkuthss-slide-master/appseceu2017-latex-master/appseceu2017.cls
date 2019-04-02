%% Copyright (C) 2017 Achim D. Brucker, https://www.brucker.ch
%%
%% License:
%%   This program can be redistributed and/or modified under the terms
%%   of the LaTeX Project Public License Distributed from CTAN
%%   archives in directory macros/latex/base/lppl.txt; either
%%   version 1 of the License, or any later version.
%%   OR
%%   The 2-clause BSD-style license.
%%
%%   SPDX-License-Identifier: LPPL-1.0+ OR BSD-2-Clause
\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{appseceu2017}%
  [2017/04/28 v0.0  LaTeX presenation class mimicking the design of the OWASP AppSecEU 2017 PowerPoint template.]
\LoadClassWithOptions{beamer}[]

\DeclareOptionBeamer{classification}{\PassOptionsToPackage{classification=#1}{beamerthemelh-presentation}}

\ProcessOptionsBeamer\relax

\usetheme{appseceu2017}
\endinput
