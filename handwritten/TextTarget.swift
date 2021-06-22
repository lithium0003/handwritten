//
//  TextTarget.swift
//  handwritten
//
//  Created by rei8 on 2020/06/02.
//  Copyright © 2020 lithium03. All rights reserved.
//

import Foundation

class TextTarget {
    let kyoiku_kanji = [
        "一右雨円王音下火花貝学気九休玉金空月犬見五口校左三山子四糸字耳七車手十出女小上森人水正生青夕石赤千川先早草足村大男竹中虫町天田土二日入年白八百文木本名目立力林六",
        "引羽雲園遠何科夏家歌画回会海絵外角楽活間丸岩顔汽記帰弓牛魚京強教近兄形計元言原戸古午後語工公広交光考行高黄合谷国黒今才細作算止市矢姉思紙寺自時室社弱首秋週春書少場色食心新親図数西声星晴切雪船線前組走多太体台地池知茶昼長鳥朝直通弟店点電刀冬当東答頭同道読内南肉馬売買麦半番父風分聞米歩母方北毎妹万明鳴毛門夜野友用曜来里理話",
        "悪安暗医委意育員院飲運泳駅央横屋温化荷界開階寒感漢館岸起期客究急級宮球去橋業曲局銀区苦具君係軽血決研県庫湖向幸港号根祭皿仕死使始指歯詩次事持式実写者主守取酒受州拾終習集住重宿所暑助昭消商章勝乗植申身神真深進世整昔全相送想息速族他打対待代第題炭短談着注柱丁帳調追定庭笛鉄転都度投豆島湯登等動童農波配倍箱畑発反坂板皮悲美鼻筆氷表秒病品負部服福物平返勉放味命面問役薬由油有遊予羊洋葉陽様落流旅両緑礼列練路和",
        "愛案以衣位囲胃印英栄塩億加果貨課芽改械害街各覚完官管関観願希季紀喜旗器機議求泣救給挙漁共協鏡競極訓軍郡径型景芸欠結建健験固功好候航康告差菜最材昨札刷殺察参産散残士氏史司試児治辞失借種周祝順初松笑唱焼象照賞臣信成省清静席積折節説浅戦選然争倉巣束側続卒孫帯隊達単置仲貯兆腸低底停的典伝徒努灯堂働特得毒熱念敗梅博飯飛費必票標不夫付府副粉兵別辺変便包法望牧末満未脈民無約勇要養浴利陸良料量輪類令冷例歴連老労録",
        "圧移因永営衛易益液演応往桜恩可仮価河過賀快解格確額刊幹慣眼基寄規技義逆久旧居許境均禁句群経潔件券険検限現減故個護効厚耕鉱構興講混査再災妻採際在財罪雑酸賛支志枝師資飼示似識質舎謝授修述術準序招承証条状常情織職制性政勢精製税責績接設舌絶銭祖素総造像増則測属率損退貸態団断築張提程適敵統銅導徳独任燃能破犯判版比肥非備俵評貧布婦富武復複仏編弁保墓報豊防貿暴務夢迷綿輸余預容略留領",
        "異遺域宇映延沿我灰拡革閣割株干巻看簡危机揮貴疑吸供胸郷勤筋系敬警劇激穴絹権憲源厳己呼誤后孝皇紅降鋼刻穀骨困砂座済裁策冊蚕至私姿視詞誌磁射捨尺若樹収宗就衆従縦縮熟純処署諸除将傷障城蒸針仁垂推寸盛聖誠宣専泉洗染善奏窓創装層操蔵臓存尊宅担探誕段暖値宙忠著庁頂潮賃痛展討党糖届難乳認納脳派拝背肺俳班晩否批秘腹奮並陛閉片補暮宝訪亡忘棒枚幕密盟模訳郵優幼欲翌乱卵覧裏律臨朗論",]
    let joyo_kanji = "亜哀握扱依偉威尉慰為維緯違井壱逸稲芋姻陰隠韻渦浦影詠鋭疫悦謁越閲宴援炎煙猿縁鉛汚凹奥押欧殴翁沖憶乙卸穏佳嫁寡暇架禍稼箇華菓蚊雅餓介塊壊怪悔懐戒拐皆劾慨概涯該垣嚇核殻獲穫較郭隔岳掛潟喝括渇滑褐轄且刈乾冠勘勧喚堪寛患憾換敢棺款歓汗環甘監緩缶肝艦貫還鑑閑陥含頑企奇岐幾忌既棋棄祈軌輝飢騎鬼偽儀宜戯擬欺犠菊吉喫詰却脚虐丘及朽窮糾巨拒拠虚距享凶叫峡恐恭挟況狂狭矯脅響驚仰凝暁斤琴緊菌襟謹吟駆愚虞偶遇隅屈掘靴繰桑勲薫傾刑啓契恵慶憩掲携渓継茎蛍鶏迎鯨撃傑倹兼剣圏堅嫌懸献肩謙賢軒遣顕幻弦玄孤弧枯誇雇顧鼓互呉娯御悟碁侯坑孔巧恒慌抗拘控攻更江洪溝甲硬稿絞綱肯荒衡貢購郊酵項香剛拷豪克酷獄腰込墾婚恨懇昆紺魂佐唆詐鎖債催宰彩栽歳砕斎載剤咲崎削搾索錯撮擦傘惨桟暫伺刺嗣施旨祉紫肢脂諮賜雌侍慈滋璽軸執湿漆疾芝赦斜煮遮蛇邪勺爵酌釈寂朱殊狩珠趣儒寿需囚愁秀臭舟襲酬醜充柔汁渋獣銃叔淑粛塾俊瞬准循旬殉潤盾巡遵庶緒叙徐償匠升召奨宵尚床彰抄掌昇晶沼渉焦症硝礁祥称粧紹肖衝訟詔詳鐘丈冗剰壌嬢浄畳譲醸錠嘱飾殖触辱伸侵唇娠寝審慎振浸紳薪診辛震刃尋甚尽迅陣酢吹帥炊睡粋衰遂酔錘随髄崇枢据杉澄瀬畝是姓征牲誓請逝斉隻惜斥析籍跡拙摂窃仙占扇栓潜旋繊薦践遷銑鮮漸禅繕塑措疎礎租粗訴阻僧双喪壮捜掃挿曹槽燥荘葬藻遭霜騒憎贈促即俗賊堕妥惰駄耐怠替泰滞胎袋逮滝卓択拓沢濯託濁諾但奪脱棚丹嘆淡端胆鍛壇弾恥痴稚致遅畜蓄逐秩窒嫡抽衷鋳駐弔彫徴懲挑眺聴脹超跳勅朕沈珍鎮陳津墜塚漬坪釣亭偵貞呈堤帝廷抵締艇訂逓邸泥摘滴哲徹撤迭添殿吐塗斗渡途奴怒倒凍唐塔悼搭桃棟盗痘筒到謄踏逃透陶騰闘洞胴峠匿督篤凸突屯豚曇鈍縄軟尼弐如尿妊忍寧猫粘悩濃把覇婆廃排杯輩培媒賠陪伯拍泊舶薄迫漠爆縛肌鉢髪伐罰抜閥伴帆搬畔繁般藩販範煩頒盤蛮卑妃彼扉披泌疲碑罷被避尾微匹姫漂描苗浜賓頻敏瓶怖扶敷普浮符腐膚譜賦赴附侮舞封伏幅覆払沸噴墳憤紛雰丙併塀幣弊柄壁癖偏遍舗捕穂募慕簿倣俸奉峰崩抱泡砲縫胞芳褒邦飽乏傍剖坊妨帽忙房某冒紡肪膨謀僕墨撲朴没堀奔翻凡盆摩磨魔麻埋膜又抹繭慢漫魅岬妙眠矛霧婿娘銘滅免茂妄猛盲網耗黙戻紋匁厄躍柳愉癒諭唯幽悠憂猶裕誘雄融与誉庸揚揺擁溶窯謡踊抑翼羅裸頼雷絡酪欄濫吏履痢離硫粒隆竜慮虜了僚寮涼猟療糧陵倫厘隣塁涙累励鈴隷零霊麗齢暦劣烈裂廉恋錬炉露廊楼浪漏郎賄惑枠湾腕"
    lazy var kanji: [Character] = {
        self.kyoiku_kanji.map({ Array($0) }).joined() + Array(self.joyo_kanji)
    }()
    lazy var num: [Character] = {
        (0...9).map({ Character("0").unicodeScalars.first!.value + $0 }).map({ String(Unicode.Scalar($0)!) }).flatMap({ Array($0) })
    }()
    lazy var lower: [Character] = {
        (0..<26).map({ Character("a").unicodeScalars.first!.value + $0 }).map({ String(Unicode.Scalar($0)!) }).flatMap({ Array($0) })
    }()
    lazy var upper: [Character] = {
        (0..<26).map({ Character("A").unicodeScalars.first!.value + $0 }).map({ String(Unicode.Scalar($0)!) }).flatMap({ Array($0) })
    }()
    lazy var hiragana: [Character] = {
        (Character("ぁ").unicodeScalars.first!.value...Character("ゖ").unicodeScalars.first!.value).map({ String(Unicode.Scalar($0)!) }).flatMap({ Array($0) })
    }()
    lazy var katakana: [Character] = {
        (Character("ァ").unicodeScalars.first!.value...Character("ヺ").unicodeScalars.first!.value).map({ String(Unicode.Scalar($0)!) }).flatMap({ Array($0) })
    }()
    let other: [Character] = Array("!#$%&()*+,-./:;<=>?@[]^{}~")
    let yakumono: [Character] = Array("〜ー。、「」『』()…‥")
    
    var userSelect: [Character] = []
    
    enum texttype {
        case hiragana
        case katakana
        case kanji
        case kigo
        case user
    }

    var count = 0
    var allCount: Int {
        get {
            switch curType {
            case .hiragana:
                return self.hiragana.count
            case .katakana:
                return self.katakana.count
            case .kanji:
                return self.kanji.count
            case .kigo:
                return self.yakumono.count
            default:
                return self.userSelect.count
            }
        }
    }
    var randomChar: [Character] = []
    var curType: texttype = .hiragana
    
    func getRandomChar(type: texttype) -> String {
        if type != curType {
            count = 0
            curType = type
        }
        if count >= randomChar.count {
            count = 0
        }
        if count == 0 {
            switch curType {
            case .hiragana:
                randomChar = self.hiragana.shuffled()
            case .katakana:
                randomChar = self.katakana.shuffled()
            case .kanji:
                randomChar = self.kanji.shuffled()
            case .kigo:
                randomChar = self.yakumono.shuffled()
            default:
                randomChar = self.userSelect.shuffled()
            }
        }
        guard count < randomChar.count else {
            return ""
        }
        let s = String(randomChar[count])
        count += 1
        return s
    }
}
