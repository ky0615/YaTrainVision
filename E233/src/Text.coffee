###
Chuo Line E233 TrainVision

Text class

Copyright (c) 2014 Koutarou Yabe

This software is released under the MIT License.

http://opensource.org/licenses/mit-license.php
###
# Āā Īī Ūū Ēē Ōō
class @Text
	next:[
		"次は"
		"Next"
	]

	next_is:[
		"です"
		""
	]
	
	num_text:[
		"号車"
		"Car No."
	]

	num:[
		""
		""
	]

	time_text:[
		"現在時刻"
		"Now"
	]

	time:[
		""
		""
	]

	destination:[
		""
		""
	]

	station_door:[
		"こちら側のドアが開きます"
		"Doors on this side will open"
	]

	destination_list:
		tokyo:[
			"東京行"
			"For Tōkyō"
		]
		kanda:[
			"神田行"
			"For Kanda"
		]
		ochanomizu:[
			"御茶ノ水行"
			"For Ochanomizu"
		]
		sinjiku:[
			"新宿行"
			"For Shinjuku"
		]
		nakano:[
			"中野行"
			"For Nakano"
		]
		mitaka:[
			"三鷹行"
			"For Mitaka"
		]
		takao:[
			"高尾行"
			"For Takao"
		]
		# 神田　御茶ノ水　新宿　中野　三鷹　東小金井　武蔵小金井　国分寺　立川　豊田　八王子　大月　相模湖　四方津　河口湖　富士山　富士吉田　　御嶽　青梅　青梅・武蔵五日市　西立川　箱根ヶ崎・武蔵五日市　武蔵五日市・高麗川　奥多摩　河辺　

	get_destination_text:(lang_flag=1, station="tokyo")=>
		if lang_flag isnt 1
			lang_flag = 0

		if not Array.isArray(station)
			# 通常
			if not @station[station]
				station = "tokyo"
			if lang_flag is 1
				# English
				return "For " + @station[station][1]
			else
				# Japanese
				return @station[station][0] + "行"
		else
			# 別れるやつ
			text = ""
			stack = []
			if lang_flag is 1
				text += "For "
			for s in station
				if not @station[s]
					s = "tokyo"
				stack.push @station[s][lang_flag]
			if lang_flag
				text += stack.join " and "
			else
				text += stack.join "・"
			if not lang_flag
				text += "行"
			return text
			require

	destination_station:

		###　青梅線・五日市線・八高線　###
		# 青梅　奥多摩
		ome_okutama:[
			"miyanohira"
			"hinatawada"
			"ishigamimae"
			"futamatao"
			"ikusabata"
			"sawai"
			"mitake"
			"kawai"
			"kori"
			"hatonosu"
			"shiromaru"
			"oku_tama"
		]
		# 河辺　青梅
		kabe_ome:[
			"higashi_ome"
			"ome"
		]
		# 拝島　河辺
		haijima_kabe:[
			"ushihama"
			"fussa"
			"hamura"
			"ozaku"
			"kabe"
		]
		# 拝島　武蔵五日市
		haijima_musashi_itsukaichi:[
			"kumagawa"
			"higashi_akiru"
			"akigawa"
			"musashi_hikida"
			"musashi_masuko"
			"musashi_itsukaichi"
		]
		# 拝島　箱根ヶ崎
		haijima_hakonegasaki:[
			"higashi_fusssa"
			"hakonegasaki"
		]
		# 箱根ヶ崎　高麗川
		hakonegasaki_komagawa:[
			"kaneko"
			"higashi_hanno"
			"komagawa"
		]
		# 立川　拝島
		tachikawa_haijima:[
			"nishi_tachikawa"
			"higashi_nakagami"
			"nakagami"
			"akishima"
			"haijima"
		]

		###　中央線　###

		# 八王子　高尾
		hachioji_takao:[
			"nishi_hachioji"
			"takao"
		]
		# 豊田　八王子
		toyoda_hachioji:[
			"hachioji"
		]
		# 立川　豊田
		tachikawa_toyoda:[
			"hino"
			"toyoda"
		]
		# 国分寺　立川
		kokubunji_tachikawa:[
			"nishi_kokubunji"
			"kunitachi"
			"tachikawa"
		]
		# 武蔵小金井　国分寺
		musashi_koganei_kokubunji:[
			"kokubunji"
		]
		# 三鷹　武蔵小金井
		mitaka_musashi_koganei:[
			"musashi_sakai"
			"higashi_koganei"
			"musashi_koganei"
		]
		# 中野　三鷹
		nakano_mitaka:[
			"koenji"
			"asagaya"
			"ogikubo"
			"nishi_ogikubo"
			"kichijoji"
			"mitaka"
		]
		# 新宿　中野
		sinjuku_nakano:[
			"okubo"
			"higashi_nakano"
			"nakano"
		]
		# 東京　新宿
		tokyo_shinjuku:[
			"kanda"
			"ochanomizu"
			"suidobashi"
			"idabashi"
			"ichigaya"
			"yotsuya"
			"sinanomachi"
			"sendagaya"
			"yoyogi"
			"shinjuku"
		]

		###　中央本線　###

		# 高尾　大月
		takao_otsuki:[
			"sagamiko"
			"fujino"
			"uenohara"
			"shiotsu"
			"yanagawa"
			"torisawa"
			"saruhashi"
			"otsuki"
		]

		###　富士急行線　###

		# 大月　河口湖
		otsuki_kawaguchiko:[
			"kamiotshuki"
			"tanokura"
			"kasei"
			"tsurushi"
			"yamuramachi"
			"tsurubunkadaigakumae"
			"tokaichiba"
			"higashikatsura"
			"mitsutoge"
			"kotobuki"
			"yoshiikeonsenmae"
			"simoyosida"
			"gekkoji"
			"fujisan"
			"fujikyuhighland"
			"kawaguchiko"
		]

	station:
		komagawa:[
			"高麗川"
			"Komagawa"
			"こまがわ"
		]
		higashi_hanno:[
			"東飯能"
			"Higashi-Hannō"
			"ひがしはんのう"
		]
		kaneko:[
			"金子"
			"Kaneko"
			"かねこ"
		]
		hakonegasaki:[
			"箱根ヶ崎"
			"Hakonegasaki"
			"はこねがさき"
		]
		higashi_fusssa:[
			"東福生"
			"Higashi_Fussa"
			"ひがしふっさ"
		]

		musashi_itsukaichi:[
			"武蔵五日市"
			"Musashi-Itsukaichi"
			"むさしいつかいち"
		]
		musashi_masuko:[
			"武蔵増戸"
			"Musashi-Masuko"
			"むさしますこ"
		]
		musashi_hikida:[
			"武蔵引田"
			"Musahi-Hikida"
			"むさしひきだ"
		]
		akigawa:[
			"秋川"
			"Akigawa"
			"あきがわ"
		]
		higashi_akiru:[
			"東秋留"
			"Higashi-Akiru"
			"ひがしあきる"
		]
		kumagawa:[
			"熊川"
			"Kumagawa"
			"くまがわ"
		]

		nishi_tachikawa:[
			"西立川"
			"Nishi-Tachikawa"
			"にしたちかわ"
		]
		higashi_nakagami:[
			"東中神"
			"Higashi-Nakagami"
			"ひがしなかがみ"
		]
		nakgami:[
			"中神"
			"Nakagami"
			"なかがみ"
		]
		akishima:[
			"昭島"
			"Akishima"
			"あきしま"
		]
		haijima:[
			"拝島"
			"Haijima"
			"はいじま"
		]
		ushihama:[
			"牛浜"
			"Ushihama"
			"うしはま"
		]
		fussa:[
			"福生"
			"Fussa"
			"ふっさ"
		]
		hamura:[
			"羽村"
			"Hamura"
			"はむら"
		]
		ozaku:[
			"小作"
			"Ozaku"
			"おざく"
		]
		kabe:[
			"河辺"
			"Kabe"
			"かべ"
		]
		higashi_ome:[
			"東青梅"
			"Higashi-Ōme"
			"ひがしおうめ"
		]
		ome:[
			"青梅"
			"Ōme"
			"おうめ"
		]
		miyanohira:[
			"宮ノ平"
			"Miyanohira"
			"みやのひら"
		]
		hinatawada:[
			"日向和田"
			"Hinatawada"
			"ひなたわだ"
		]
		ishigamimae:[
			"石神前"
			"Ishigamimae"
			"いしがみまえ"
		]
		futamatao:[
			"二俣尾"
			"Futamatao"
			"ふたまたお"
		]
		ikusabata:[
			"軍畑"
			"Ikusabata"
			"いくさばた"
		]
		sawai:[
			"沢井"
			"Sawai"
			"さわい"
		]
		mitake:[
			"御嶽"
			"Mitake"
			"みたけ"
		]
		kawai:[
			"川井"
			"Kawai"
			"かわい"
		]
		kori:[
			"古里"
			"Kori"
			"こり"
		]
		hatonosu:[
			"鳩ノ巣"
			"Hatonosu"
			"はとのす"
		]
		shiromaru:[
			"白丸"
			"Shiromaru"
			"しろまる"
		]
		oku_tama:[
			"奥多摩"
			"Oku-Tama"
			"おくたま"
		]

		otsuki:[
			"大月"
			"Ōtsuki"
			"おおつき"
		]
		saruhashi:[
			"猿橋"
			"saruhashi"
			"さるはし"
		]
		torisawa:[
			"鳥沢"
			"Torisawa"
			"とりさわ"
		]
		yanagawa:[
			"梁川"
			"Yabagawa"
			"やながわ"
		]
		shiotsu:[
			"四方津"
			"Shiotsu"
			"しおつ"
		]
		uenohara:[
			"上野原"
			"Uenohara"
			"うえのはら"
		]
		fujino:[
			"藤野"
			"Fujino"
			"ふじの"
		]
		sagamiko:[
			"相模湖"
			"Sagamiko"
			"さがみこ"
		]

		takao:[
			"高尾"
			"Takao"
			"たかお"
		]
		nishi_hachioji:[
			"西八王子"
			"Nishi-Hachiōji"
			"にしはちおうじ"
		]
		hachioji:[
			"八王子"
			"Hachiōji"
			"はちおうじ"
		]
		toyoda:[
			"豊田"
			"Toyoda"
			"とよだ"
		]
		hino:[
			"日野"
			"Hino"
			"ひの"
		]
		tachikawa:[
			"立川"
			"Tachikawa"
			"たちかわ"
		]
		kunitachi:[
			"国立"
			"Kunitachi"
			"くにたち"
		]
		nishi_kokubunji:[
			"西国分寺"
			"Nishi-Kokubunji" # 15
			"にしこくぶんじ"
		]
		kokubunji:[
			"国分寺"
			"Kokubunji" # 9
			"こくぶんじ"
		]
		musashi_koganei:[
			"武蔵小金井"
			"Musashi-Koganei" # 15
			"むさしこがねい"
		]
		higashi_koganei:[
			"東小金井"
			"Higashi-Koganei" # 15
			"ひがしこがねい"
		]
		musashi_sakai:[
			"武蔵境"
			"Musashi-Sakai" # 13
			"むさしさかい"
		]
		mitaka:[
			"三鷹"
			"Mitaka"
			"みたか"
		]
		kichijoji:[
			"吉祥寺"
			"Kichijōji"
			"きちじょうじ"
		]
		nishi_ogikubo:[
			"西荻窪"
			"Nishi-Ogikubo"
			"にしおぎくぼ"
		]
		ogikubo:[
			"荻窪"
			"Ogikubo"
			"おぎくぼ"
		]
		asagaya:[
			"阿佐ヶ谷"
			"Asagaya"
			"あさがや"
		]
		koenji:[
			"高円寺"
			"Kōenji"
			"こうえんじ"
		]
		nakano:[
			"中野"
			"Nakano"
			"なかの"
		]
		higasinakano:[
			"東中野"
			"Higashi-nakano"
			"ひがしなかの"
		]
		okubo:[
			"大久保"
			"Ōkubo"
			"おおくぼ"
		]
		sinjiku:[
			"新宿"
			"Shinjuku"
			"しんじゅく"
		]
		yoyogi:[
			"代々木"
			"Yoyogi"
			"よよぎ"
		]
		sendagaya:[
			"千駄ヶ谷"
			"Sendagaya"
			"せんだがや"
		]
		sinanomachi:[
			"信濃町"
			"Shinanomachi"
			"しなのまち"
		]
		yotsuya:[
			"四ツ谷"
			"Yotsuya"
			"よつや"
		]
		ichigaya:[
			"市ヶ谷"
			"Ichigaya"
			"いちがや"
		]
		idabashi:[
			"飯田橋"
			"Idabashi"
			"いいだばし"
		]
		suidobashi:[
			"水道橋"
			"SuidōBashi"
			"すいどうばし"
		]
		ochanomizu:[
			"御茶ノ水"
			"Ochanomizu"
			"おちゃのみず"
		]
		kanda:[
			"神田"
			"Kanda"
			"かんだ"
		]
		tokyo:[
			"東京"
			"Tōkyō"
			"とうきょう"
		]
