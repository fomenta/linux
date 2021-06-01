; Directives, keywords
#SingleInstance Force
; #NoTrayIcon

#IfWinActive ahk_class IQ_OPTION
;Lineal
;Trades := [1, 2, 5, 12, 29] ; 70%
;Trades := [1, 2, 4, 9, 21] ; 80%
;Trades := [1, 2, 4, 9, 19] ; 85%
;Trades := [1, 2, 4, 8, 17] ; 90%
;Trades := [1, 2, 4, 8, 16] ; 95%
;
; Mantingale (starts with $3 gain)
;Trades := [3.8, 11, 26, 61, 139] ; 80%
;Trades := [1.3, 6, 16, 38, 88] ; 80%
;Trades := [1.2, 5, 14, 33, 75] ; 84%
;Trades := [1.1, 5, 13, 31, 68] ; 87% - 2.0x
;Trades := [1.1, 4, 10, 23, 50, 109] ; 87% - 1.0x
;Trades := [114.9, 363, 895, 2038, 4496, 9779] ; 87% - 1.0x
;Trades := [1.1, 4, 10, 23, 50, 109, 235, 506, 1089] ; 87% - 1.0x
Trades := [1100.5, 3700, 9100]  ; 87% - 1.0x

SendTrade(Iteration) {
	Global Trades
	Send, {Click}
	Send, {End}+{Home}
	Send, % Trades[Iteration]
	Send, {Esc}
}

1::SendTrade(1)
2::SendTrade(2)
3::SendTrade(3)
4::SendTrade(4)
5::SendTrade(5)
6::SendTrade(6)
7::SendTrade(7)
8::SendTrade(8)
9::SendTrade(9)

#IfWinActive
