
local ts = game:GetService("TweenService")
local ui = game:GetService("UserInputService")
local plr = game:GetService("Players")
local lg = game:GetService("Lighting")
local rs = game:GetService("RunService")
local gs = game:GetService("GuiService")
local hs = game:GetService("HttpService")

local n = "Acrylic"

local c = {
    Background = Color3.fromRGB(12, 12, 12),
    Secondary = Color3.fromRGB(20, 20, 20),
    Border = Color3.fromRGB(39, 39, 39),
    Text = Color3.fromRGB(255, 255, 255),
    TextDark = Color3.fromRGB(93, 93, 93),
    TextFade = Color3.fromRGB(9, 9, 9),
    Accent = Color3.fromRGB(255, 255, 255),
    Toggle = {
        Enabled = Color3.fromRGB(255, 255, 255),
        Disabled = Color3.fromRGB(32, 32, 32),
        Circle = Color3.fromRGB(20, 20, 20)
    },
    Notification = {
        Background = Color3.fromRGB(11, 11, 11),
        Border = Color3.fromRGB(26, 26, 26),
        Timer = Color3.fromRGB(255, 255, 255)
    }
}

local LucideIcons = {["a-arrow-down"] = "rbxassetid://92867583610071",
	["a-arrow-up"] = "rbxassetid://132318504999733",
	["a-large-small"] = "rbxassetid://111491496660216",
	["accessibility"] = "rbxassetid://114029945302017",
	["activity"] = "rbxassetid://94212016861936",
	["air-vent"] = "rbxassetid://81517226012329",
	["airplay"] = "rbxassetid://115020759309179",
	["alarm-clock-check"] = "rbxassetid://76437352099157",
	["alarm-clock-minus"] = "rbxassetid://77364179863205",
	["alarm-clock-off"] = "rbxassetid://97904885874823",
	["alarm-clock-plus"] = "rbxassetid://80468822979214",
	["alarm-clock"] = "rbxassetid://126259032907535",["alarm-smoke"] = "rbxassetid://96965448419685",
	["album"] = "rbxassetid://127358331163602",
	["align-center-horizontal"] = "rbxassetid://81570549209434",
	["align-center-vertical"] = "rbxassetid://118470463752466",["align-end-horizontal"] = "rbxassetid://139502909745427",
	["align-end-vertical"] = "rbxassetid://96528869059554",
	["align-horizontal-distribute-center"] = "rbxassetid://97220086126656",["align-horizontal-distribute-end"] = "rbxassetid://106128590702022",
	["align-horizontal-distribute-start"] = "rbxassetid://76074660002997",["align-horizontal-justify-center"] = "rbxassetid://75732302772427",
	["align-horizontal-justify-end"] = "rbxassetid://129167626402283",
	["align-horizontal-justify-start"] = "rbxassetid://130161830325281",["align-horizontal-space-around"] = "rbxassetid://91646106782950",
	["align-horizontal-space-between"] = "rbxassetid://103886093046990",["align-start-horizontal"] = "rbxassetid://125674804697729",
	["align-start-vertical"] = "rbxassetid://105020230154823",
	["align-vertical-distribute-center"] = "rbxassetid://93791183635525",["align-vertical-distribute-end"] = "rbxassetid://139354223511433",
	["align-vertical-distribute-start"] = "rbxassetid://74961997822126",["align-vertical-justify-center"] = "rbxassetid://134754696166569",
	["align-vertical-justify-end"] = "rbxassetid://92569381441969",
	["align-vertical-justify-start"] = "rbxassetid://99692844572718",["align-vertical-space-around"] = "rbxassetid://96206012459190",
	["align-vertical-space-between"] = "rbxassetid://124998077349706",
	["ambulance"] = "rbxassetid://78599995190651",
	["ampersand"] = "rbxassetid://75272915739209",
	["ampersands"] = "rbxassetid://126947193455996",
	["amphora"] = "rbxassetid://137370389604364",
	["anchor"] = "rbxassetid://92181172123618",
	["angry"] = "rbxassetid://74237056000103",
	["annoyed"] = "rbxassetid://80064369052011",
	["antenna"] = "rbxassetid://99628923540956",
	["anvil"] = "rbxassetid://100203029845919",
	["aperture"] = "rbxassetid://83396154449972",
	["app-window-mac"] = "rbxassetid://79587216113811",
	["app-window"] = "rbxassetid://93142176757189",
	["apple"] = "rbxassetid://104349242902442",["archive-restore"] = "rbxassetid://78956681942188",
	["archive-x"] = "rbxassetid://75830115088395",
	["archive"] = "rbxassetid://122180020814574",
	["armchair"] = "rbxassetid://105384358373973",["arrow-big-down-dash"] = "rbxassetid://137987229582002",
	["arrow-big-down"] = "rbxassetid://81081164158885",
	["arrow-big-left-dash"] = "rbxassetid://97827621354677",["arrow-big-left"] = "rbxassetid://85973092492641",
	["arrow-big-right-dash"] = "rbxassetid://117825834972403",
	["arrow-big-right"] = "rbxassetid://82960676755590",["arrow-big-up-dash"] = "rbxassetid://99260194327483",
	["arrow-big-up"] = "rbxassetid://93136954756149",
	["arrow-down-0-1"] = "rbxassetid://120961896217875",["arrow-down-1-0"] = "rbxassetid://93474255891850",
	["arrow-down-a-z"] = "rbxassetid://99554596207900",
	["arrow-down-from-line"] = "rbxassetid://132045845807798",
	["arrow-down-left"] = "rbxassetid://102899325237364",
	["arrow-down-narrow-wide"] = "rbxassetid://129105261655061",["arrow-down-right"] = "rbxassetid://123109928624974",
	["arrow-down-to-dot"] = "rbxassetid://101675355931221",
	["arrow-down-to-line"] = "rbxassetid://87050478931254",["arrow-down-up"] = "rbxassetid://85780258549577",
	["arrow-down-wide-narrow"] = "rbxassetid://88461733425991",
	["arrow-down-z-a"] = "rbxassetid://76115279362232",["arrow-down"] = "rbxassetid://98764963621439",
	["arrow-left-from-line"] = "rbxassetid://87857914437603",
	["arrow-left-right"] = "rbxassetid://131324733048447",["arrow-left-to-line"] = "rbxassetid://118645136026970",
	["arrow-left"] = "rbxassetid://102531941843733",
	["arrow-right-from-line"] = "rbxassetid://74073639809355",["arrow-right-left"] = "rbxassetid://77015754304300",
	["arrow-right-to-line"] = "rbxassetid://78632510329852",
	["arrow-right"] = "rbxassetid://113692007244654",["arrow-up-0-1"] = "rbxassetid://105257823943016",
	["arrow-up-1-0"] = "rbxassetid://134175521693798",
	["arrow-up-a-z"] = "rbxassetid://77763416595160",
	["arrow-up-down"] = "rbxassetid://81019887641527",
	["arrow-up-from-dot"] = "rbxassetid://124408496673275",["arrow-up-from-line"] = "rbxassetid://95777664626453",
	["arrow-up-left"] = "rbxassetid://123490598231261",
	["arrow-up-narrow-wide"] = "rbxassetid://73006024672636",["arrow-up-right"] = "rbxassetid://129280608535523",
	["arrow-up-to-line"] = "rbxassetid://108818207813537",
	["arrow-up-wide-narrow"] = "rbxassetid://87437426951568",["arrow-up-z-a"] = "rbxassetid://107546173611884",
	["arrow-up"] = "rbxassetid://89282378235317",
	["arrows-up-from-line"] = "rbxassetid://133710016938621",["asterisk"] = "rbxassetid://88552752106723",
	["at-sign"] = "rbxassetid://79059152889146",
	["atom"] = "rbxassetid://73167696981648",
	["audio-lines"] = "rbxassetid://70930641819242",
	["audio-waveform"] = "rbxassetid://86462036665209",
	["award"] = "rbxassetid://132740088158419",
	["axe"] = "rbxassetid://132405197863294",["axis-3d"] = "rbxassetid://122438676546804",
	["baby"] = "rbxassetid://93472926933440",
	["backpack"] = "rbxassetid://140420225386018",
	["badge-alert"] = "rbxassetid://101829200081951",
	["badge-cent"] = "rbxassetid://133345018873154",
	["badge-check"] = "rbxassetid://76078495178149",["badge-dollar-sign"] = "rbxassetid://127139803581141",
	["badge-euro"] = "rbxassetid://120016477674659",
	["badge-indian-rupee"] = "rbxassetid://75659682309981",["badge-info"] = "rbxassetid://131995373201472",
	["badge-japanese-yen"] = "rbxassetid://99081574588615",
	["badge-minus"] = "rbxassetid://140321561183881",
	["badge-percent"] = "rbxassetid://121359224294885",["badge-plus"] = "rbxassetid://100325578561866",
	["badge-pound-sterling"] = "rbxassetid://119688217279444",
	["badge-question-mark"] = "rbxassetid://121464963737502",["badge-russian-ruble"] = "rbxassetid://108839463659864",
	["badge-swiss-franc"] = "rbxassetid://91447608372740",
	["badge-turkish-lira"] = "rbxassetid://137839965873529",["badge-x"] = "rbxassetid://122931434733842",
	["badge"] = "rbxassetid://116620312917084",
	["baggage-claim"] = "rbxassetid://86922213051957",
	["ban"] = "rbxassetid://90767043015246",
	["banana"] = "rbxassetid://140713420056179",
	["bandage"] = "rbxassetid://129660129590770",["banknote-arrow-down"] = "rbxassetid://139366449345199",
	["banknote-arrow-up"] = "rbxassetid://133758343082529",
	["banknote-x"] = "rbxassetid://95348701438065",["banknote"] = "rbxassetid://104840231536668",
	["barcode"] = "rbxassetid://118473018143689",
	["barrel"] = "rbxassetid://130647115622774",
	["baseline"] = "rbxassetid://124677132511270",
	["bath"] = "rbxassetid://76031400297942",
	["battery-charging"] = "rbxassetid://80139357470047",
	["battery-full"] = "rbxassetid://70906718268972",
	["battery-low"] = "rbxassetid://139659256984314",
	["battery-medium"] = "rbxassetid://105934079398915",
	["battery-plus"] = "rbxassetid://91931341486966",["battery-warning"] = "rbxassetid://115230083817257",
	["battery"] = "rbxassetid://70765800346189",
	["beaker"] = "rbxassetid://80902539995520",
	["bean-off"] = "rbxassetid://98164436608714",
	["bean"] = "rbxassetid://89491967076869",
	["bed-double"] = "rbxassetid://73820193212911",
	["bed-single"] = "rbxassetid://113423940880634",
	["bed"] = "rbxassetid://97726529032925",
	["beef"] = "rbxassetid://105850162318915",
	["beer-off"] = "rbxassetid://120333134736361",
	["beer"] = "rbxassetid://116404978807744",["bell-dot"] = "rbxassetid://93161277118810",
	["bell-electric"] = "rbxassetid://100277767266983",
	["bell-minus"] = "rbxassetid://126334890449727",
	["bell-off"] = "rbxassetid://78560046118930",["bell-plus"] = "rbxassetid://77014333795836",
	["bell-ring"] = "rbxassetid://94612128913941",
	["bell"] = "rbxassetid://97392696311902",
	["between-horizontal-end"] = "rbxassetid://81602774794322",
	["between-horizontal-start"] = "rbxassetid://76112384929846",
	["between-vertical-end"] = "rbxassetid://72817612571631",
	["between-vertical-start"] = "rbxassetid://85278312190301",
	["biceps-flexed"] = "rbxassetid://82004462003936",
	["bike"] = "rbxassetid://102930322246035",
	["binary"] = "rbxassetid://91751953950088",
	["binoculars"] = "rbxassetid://101460003267896",
	["biohazard"] = "rbxassetid://95956532900432",["bird"] = "rbxassetid://132284145117371",
	["birdhouse"] = "rbxassetid://83999157401433",
	["bitcoin"] = "rbxassetid://95459240442938",
	["blend"] = "rbxassetid://111679612185257",
	["blinds"] = "rbxassetid://71164165283925",
	["blocks"] = "rbxassetid://72212693357737",["bluetooth-connected"] = "rbxassetid://96315134002985",
	["bluetooth-off"] = "rbxassetid://80600044218117",
	["bluetooth-searching"] = "rbxassetid://100673019606426",
	["bluetooth"] = "rbxassetid://90506573139443",
	["bold"] = "rbxassetid://116141470019166",
	["bolt"] = "rbxassetid://102881251417484",["bomb"] = "rbxassetid://139223800924636",
	["bone"] = "rbxassetid://111242153474115",
	["book-a"] = "rbxassetid://104067275658465",
	["book-alert"] = "rbxassetid://124159928044853",
	["book-audio"] = "rbxassetid://109208148317037",
	["book-check"] = "rbxassetid://115999656081696",
	["book-copy"] = "rbxassetid://108543407492005",
	["book-dashed"] = "rbxassetid://127430784795958",
	["book-down"] = "rbxassetid://101011730128222",
	["book-headphones"] = "rbxassetid://108670200799574",
	["book-heart"] = "rbxassetid://112788845135284",
	["book-image"] = "rbxassetid://80808285757226",
	["book-key"] = "rbxassetid://116024426170705",
	["book-lock"] = "rbxassetid://118765061220571",["book-marked"] = "rbxassetid://73211024251780",
	["book-minus"] = "rbxassetid://112724962046282",
	["book-open-check"] = "rbxassetid://130848362492667",["book-open-text"] = "rbxassetid://100629528672195",
	["book-open"] = "rbxassetid://129845326810392",
	["book-plus"] = "rbxassetid://140267785051233",
	["book-text"] = "rbxassetid://94011772484232",
	["book-type"] = "rbxassetid://97817304725443",
	["book-up-2"] = "rbxassetid://130161620853665",
	["book-up"] = "rbxassetid://98640174079190",
	["book-user"] = "rbxassetid://128489189240523",
	["book-x"] = "rbxassetid://118754548186537",
	["book"] = "rbxassetid://125383279695672",
	["bookmark-check"] = "rbxassetid://93940443347986",
	["bookmark-minus"] = "rbxassetid://96807096039910",
	["bookmark-plus"] = "rbxassetid://121469724491615",["bookmark-x"] = "rbxassetid://112272342584706",
	["bookmark"] = "rbxassetid://121093149326239",
	["boom-box"] = "rbxassetid://99901322535868",
	["bot-message-square"] = "rbxassetid://96145330292478",
	["bot-off"] = "rbxassetid://140417690560013",
	["bot"] = "rbxassetid://80451686744860",
	["bottle-wine"] = "rbxassetid://131675403196921",
	["bow-arrow"] = "rbxassetid://124089655150375",
	["box"] = "rbxassetid://101768155599700",
	["boxes"] = "rbxassetid://136372617578355",
	["braces"] = "rbxassetid://117761094704041",
	["brackets"] = "rbxassetid://74368995728099",
	["brain-circuit"] = "rbxassetid://70547962410202",
	["brain-cog"] = "rbxassetid://132039205501538",
	["brain"] = "rbxassetid://92424107303177",["brick-wall-fire"] = "rbxassetid://92980588705520",
	["brick-wall-shield"] = "rbxassetid://75954432775071",
	["brick-wall"] = "rbxassetid://112878522258821",
	["briefcase-business"] = "rbxassetid://129135125207283",
	["briefcase-conveyor-belt"] = "rbxassetid://108665725653714",
	["briefcase-medical"] = "rbxassetid://119917756334087",
	["briefcase"] = "rbxassetid://96754188164225",["bring-to-front"] = "rbxassetid://132975903553748",
	["brush-cleaning"] = "rbxassetid://71728977448805",
	["brush"] = "rbxassetid://127035535799640",
	["bubbles"] = "rbxassetid://106183424168227",
	["bug-off"] = "rbxassetid://88020025049245",
	["bug-play"] = "rbxassetid://80107955888092",
	["bug"] = "rbxassetid://83626408925438",
	["building-2"] = "rbxassetid://77873775611951",
	["building"] = "rbxassetid://110616258983082",
	["bus-front"] = "rbxassetid://89863432456045",
	["bus"] = "rbxassetid://133798469717463",
	["cable-car"] = "rbxassetid://128643682205596",
	["cable"] = "rbxassetid://128449944504901",["cake-slice"] = "rbxassetid://136769828413242",
	["cake"] = "rbxassetid://103131590503275",
	["calculator"] = "rbxassetid://74915716529646",
	["calendar-1"] = "rbxassetid://98458364171044",
	["calendar-arrow-down"] = "rbxassetid://108415736543437",
	["calendar-arrow-up"] = "rbxassetid://70574654109118",
	["calendar-check-2"] = "rbxassetid://120231170248276",
	["calendar-check"] = "rbxassetid://71551019465748",
	["calendar-clock"] = "rbxassetid://119132152594595",
	["calendar-cog"] = "rbxassetid://122402172360287",
	["calendar-days"] = "rbxassetid://99072017568595",["calendar-fold"] = "rbxassetid://117368871270394",
	["calendar-heart"] = "rbxassetid://88839008103676",
	["calendar-minus-2"] = "rbxassetid://98846170279891",
	["calendar-minus"] = "rbxassetid://137354318924383",["calendar-off"] = "rbxassetid://109726151749217",
	["calendar-plus-2"] = "rbxassetid://112264562093883",
	["calendar-plus"] = "rbxassetid://125266115249843",
	["calendar-range"] = "rbxassetid://103641849247576",
	["calendar-search"] = "rbxassetid://92010083223634",
	["calendar-sync"] = "rbxassetid://78082218499697",
	["calendar-x-2"] = "rbxassetid://107518051061147",
	["calendar-x"] = "rbxassetid://106703374806500",
	["calendar"] = "rbxassetid://114792700814035",
	["camera-off"] = "rbxassetid://81057636835256",
	["camera"] = "rbxassetid://79950339943067",
	["candy-cane"] = "rbxassetid://71689468772492",
	["candy-off"] = "rbxassetid://110232752314832",
	["candy"] = "rbxassetid://107812129154678",
	["cannabis"] = "rbxassetid://98792006538601",
	["captions-off"] = "rbxassetid://105223545364193",
	["captions"] = "rbxassetid://104960225031445",["car-front"] = "rbxassetid://87380942739063",
	["car-taxi-front"] = "rbxassetid://122455403384057",
	["car"] = "rbxassetid://121065933462582",
	["caravan"] = "rbxassetid://120070979471783",
	["card-sim"] = "rbxassetid://134490550095771",
	["carrot"] = "rbxassetid://119118221444304",
	["case-lower"] = "rbxassetid://129303130603241",
	["case-sensitive"] = "rbxassetid://125410273293056",
	["case-upper"] = "rbxassetid://111633433531325",["cassette-tape"] = "rbxassetid://137065788934157",
	["cast"] = "rbxassetid://98202245922071",
	["castle"] = "rbxassetid://119275077187784",
	["cat"] = "rbxassetid://124252153404931",
	["cctv"] = "rbxassetid://99979894766624",["chart-area"] = "rbxassetid://123446436762366",
	["chart-bar-big"] = "rbxassetid://72336824986044",
	["chart-bar-decreasing"] = "rbxassetid://107217459044963",["chart-bar-increasing"] = "rbxassetid://88268905998571",
	["chart-bar-stacked"] = "rbxassetid://98478751113024",
	["chart-bar"] = "rbxassetid://105389816384108",
	["chart-candlestick"] = "rbxassetid://125676898615697",["chart-column-big"] = "rbxassetid://98598733210787",
	["chart-column-decreasing"] = "rbxassetid://73586137373563",
	["chart-column-increasing"] = "rbxassetid://120421615068601",["chart-column-stacked"] = "rbxassetid://86031449675105",
	["chart-column"] = "rbxassetid://97915995538580",
	["chart-gantt"] = "rbxassetid://88811660555940",
	["chart-line"] = "rbxassetid://101833156055618",["chart-network"] = "rbxassetid://104027882693561",
	["chart-no-axes-column-decreasing"] = "rbxassetid://123371717192542",["chart-no-axes-column-increasing"] = "rbxassetid://140383830943049",
	["chart-no-axes-column"] = "rbxassetid://94078751170351",
	["chart-no-axes-combined"] = "rbxassetid://121424233161912",["chart-no-axes-gantt"] = "rbxassetid://131936541106368",
	["chart-pie"] = "rbxassetid://113412261630136",
	["chart-scatter"] = "rbxassetid://108217585014571",["chart-spline"] = "rbxassetid://90307460742494",
	["check-check"] = "rbxassetid://95183312173858",
	["check-line"] = "rbxassetid://115122343485290",
	["check"] = "rbxassetid://93898873302694",
	["chef-hat"] = "rbxassetid://121744015002573",
	["cherry"] = "rbxassetid://139519182403183",
	["chess-bishop"] = "rbxassetid://121701705580238",
	["chess-king"] = "rbxassetid://90885687223462",
	["chess-knight"] = "rbxassetid://96467707042169",["chess-pawn"] = "rbxassetid://111318574652751",
	["chess-queen"] = "rbxassetid://98304702099749",
	["chess-rook"] = "rbxassetid://76223925830262",
	["chevron-down"] = "rbxassetid://134243273101015",
	["chevron-first"] = "rbxassetid://105243363790238",
	["chevron-last"] = "rbxassetid://89268452603731",
	["chevron-left"] = "rbxassetid://73780377692148",
	["chevron-right"] = "rbxassetid://92473583511724",
	["chevron-up"] = "rbxassetid://122444883127455",["chevrons-down-up"] = "rbxassetid://139404716013205",
	["chevrons-down"] = "rbxassetid://100524612205956",["chevrons-left-right-ellipsis"] = "rbxassetid://125035817741526",
	["chevrons-left-right"] = "rbxassetid://87910685945204",
	["chevrons-left"] = "rbxassetid://82617201744347",["chevrons-right-left"] = "rbxassetid://87149546686569",
	["chevrons-right"] = "rbxassetid://139121276490483",
	["chevrons-up-down"] = "rbxassetid://131833120209646",["chevrons-up"] = "rbxassetid://100467452364672",
	["chromium"] = "rbxassetid://128165143739006",
	["church"] = "rbxassetid://113714744350666",
	["cigarette-off"] = "rbxassetid://77797883078452",["circle-alert"] = "rbxassetid://83898160590116",
	["circle-arrow-down"] = "rbxassetid://95901860261344",
	["circle-arrow-left"] = "rbxassetid://102148876968988",["circle-arrow-out-down-left"] = "rbxassetid://140598097856694",
	["circle-arrow-out-down-right"] = "rbxassetid://119952801379305",["circle-arrow-out-up-left"] = "rbxassetid://132858212688303",
	["circle-arrow-out-up-right"] = "rbxassetid://81783743753173",
	["circle-arrow-right"] = "rbxassetid://70786767999559",["circle-arrow-up"] = "rbxassetid://84395128546494",
	["circle-check-big"] = "rbxassetid://93202927221730",
	["circle-check"] = "rbxassetid://85262178816537",
	["circle-chevron-down"] = "rbxassetid://137069490345718",
	["circle-chevron-left"] = "rbxassetid://130250009740827",
	["circle-chevron-right"] = "rbxassetid://125943696958495",
	["circle-chevron-up"] = "rbxassetid://111223574026321",
	["circle-dashed"] = "rbxassetid://126799443883746",
	["circle-divide"] = "rbxassetid://106398997754208",
	["circle-dollar-sign"] = "rbxassetid://91106238890387",["circle-dot-dashed"] = "rbxassetid://111451232827180",
	["circle-dot"] = "rbxassetid://82947033619201",
	["circle-ellipsis"] = "rbxassetid://91687150884779",
	["circle-equal"] = "rbxassetid://95133963751438",["circle-fading-arrow-up"] = "rbxassetid://104648212910336",
	["circle-fading-plus"] = "rbxassetid://91847890443490",
	["circle-gauge"] = "rbxassetid://108157549473765",["circle-minus"] = "rbxassetid://133556159576809",
	["circle-off"] = "rbxassetid://97923456918886",
	["circle-parking-off"] = "rbxassetid://128369410981252",
	["circle-parking"] = "rbxassetid://124034962915196",["circle-pause"] = "rbxassetid://139337739700879",
	["circle-percent"] = "rbxassetid://133311912860256",
	["circle-play"] = "rbxassetid://120408917249739",
	["circle-plus"] = "rbxassetid://113157136350384",["circle-pound-sterling"] = "rbxassetid://105476153083828",
	["circle-power"] = "rbxassetid://140676030155098",
	["circle-question-mark"] = "rbxassetid://97516698664325",["circle-slash-2"] = "rbxassetid://136766902186549",
	["circle-slash"] = "rbxassetid://125206439913049",
	["circle-small"] = "rbxassetid://73685402843600",
	["circle-star"] = "rbxassetid://120318414957104",
	["circle-stop"] = "rbxassetid://87400503942659",
	["circle-user-round"] = "rbxassetid://95489465399880",
	["circle-user"] = "rbxassetid://136220511671311",
	["circle-x"] = "rbxassetid://76821953846248",
	["circle"] = "rbxassetid://130359823580534",["circuit-board"] = "rbxassetid://107695264369312",
	["citrus"] = "rbxassetid://139018222976433",
	["clapperboard"] = "rbxassetid://132660667070200",
	["clipboard-check"] = "rbxassetid://92649798577170",["clipboard-clock"] = "rbxassetid://123957515687745",
	["clipboard-copy"] = "rbxassetid://125851897718493",
	["clipboard-list"] = "rbxassetid://96460215958908",
	["clipboard-minus"] = "rbxassetid://107968008485671",
	["clipboard-paste"] = "rbxassetid://74382068849983",
	["clipboard-pen-line"] = "rbxassetid://77711589791615",
	["clipboard-pen"] = "rbxassetid://75290966822953",
	["clipboard-plus"] = "rbxassetid://134285318675662",
	["clipboard-type"] = "rbxassetid://89949374318028",["clipboard-x"] = "rbxassetid://102222456890103",
	["clipboard"] = "rbxassetid://89601995828423",
	["clock-1"] = "rbxassetid://129363225422045",
	["clock-10"] = "rbxassetid://104332695855541",
	["clock-11"] = "rbxassetid://119023205186105",["clock-12"] = "rbxassetid://117789618723068",
	["clock-2"] = "rbxassetid://134710777209413",
	["clock-3"] = "rbxassetid://136385631189327",
	["clock-4"] = "rbxassetid://121808839832144",["clock-5"] = "rbxassetid://85082019959457",
	["clock-6"] = "rbxassetid://71009733505593",
	["clock-7"] = "rbxassetid://103111188546225",
	["clock-8"] = "rbxassetid://110059272125337",["clock-9"] = "rbxassetid://77610027126437",
	["clock-alert"] = "rbxassetid://97157344465162",
	["clock-arrow-down"] = "rbxassetid://92349314416042",
	["clock-arrow-up"] = "rbxassetid://111484286332629",["clock-check"] = "rbxassetid://85231630218857",
	["clock-fading"] = "rbxassetid://93205297285245",
	["clock-plus"] = "rbxassetid://93367709263150",
	["clock"] = "rbxassetid://121808839832144",
	["closed-caption"] = "rbxassetid://99832644030788",
	["cloud-alert"] = "rbxassetid://91967273658626",["cloud-check"] = "rbxassetid://97318598202432",
	["cloud-cog"] = "rbxassetid://96497764065749",
	["cloud-download"] = "rbxassetid://121435581993566",
	["cloud-drizzle"] = "rbxassetid://139525315752605",
	["cloud-fog"] = "rbxassetid://76650233148776",
	["cloud-hail"] = "rbxassetid://72320462748242",
	["cloud-lightning"] = "rbxassetid://133517088924849",
	["cloud-moon-rain"] = "rbxassetid://127667837827018",["cloud-moon"] = "rbxassetid://71938114737914",
	["cloud-off"] = "rbxassetid://131907154501444",
	["cloud-rain-wind"] = "rbxassetid://107414583736721",
	["cloud-rain"] = "rbxassetid://105547081967408",["cloud-snow"] = "rbxassetid://72307126270226",
	["cloud-sun-rain"] = "rbxassetid://99041604425705",
	["cloud-sun"] = "rbxassetid://86114208148727",
	["cloud-upload"] = "rbxassetid://93307473217005",
	["cloud"] = "rbxassetid://121226497050352",["cloudy"] = "rbxassetid://105360479023346",
	["clover"] = "rbxassetid://74925550436750",
	["club"] = "rbxassetid://108490365816628",
	["code-xml"] = "rbxassetid://130150477351734",
	["code"] = "rbxassetid://107380207681249",
	["codepen"] = "rbxassetid://135643965971885",["codesandbox"] = "rbxassetid://106911852964823",
	["coffee"] = "rbxassetid://106864403231093",
	["cog"] = "rbxassetid://116544501716299",
	["coins"] = "rbxassetid://116510979641930",
	["columns-2"] = "rbxassetid://113004100221850",["columns-3-cog"] = "rbxassetid://121589691981064",
	["columns-3"] = "rbxassetid://115223357399375",
	["columns-4"] = "rbxassetid://130807991968419",
	["combine"] = "rbxassetid://79908476334048",
	["command"] = "rbxassetid://93648221906330",["compass"] = "rbxassetid://115123411028382",
	["component"] = "rbxassetid://110027788875080",
	["computer"] = "rbxassetid://77480056459407",
	["concierge-bell"] = "rbxassetid://140384259310436",
	["cone"] = "rbxassetid://97759550688437",
	["construction"] = "rbxassetid://106539489968173",["contact-round"] = "rbxassetid://71907624112229",
	["contact"] = "rbxassetid://75868297719012",
	["container"] = "rbxassetid://91507237573499",
	["contrast"] = "rbxassetid://112796643981497",
	["cookie"] = "rbxassetid://73159504540002",
	["cooking-pot"] = "rbxassetid://94959783129799",["copy-check"] = "rbxassetid://91177247988892",
	["copy-minus"] = "rbxassetid://109524509933035",
	["copy-plus"] = "rbxassetid://113618379616952",
	["copy-slash"] = "rbxassetid://93805787810390",["copy-x"] = "rbxassetid://106557557978061",
	["copy"] = "rbxassetid://78979572434545",
	["copyleft"] = "rbxassetid://78559055698593",
	["copyright"] = "rbxassetid://129433635747111",
	["corner-down-left"] = "rbxassetid://90473561177832",["corner-down-right"] = "rbxassetid://86512767702085",
	["corner-left-down"] = "rbxassetid://139876989150630",
	["corner-left-up"] = "rbxassetid://126228268096099",["corner-right-down"] = "rbxassetid://89237035551302",
	["corner-right-up"] = "rbxassetid://112851237026705",
	["corner-up-left"] = "rbxassetid://84669279763024",
	["corner-up-right"] = "rbxassetid://115099889693145",
	["cpu"] = "rbxassetid://77549309870247",
	["creative-commons"] = "rbxassetid://90408210735312",
	["credit-card"] = "rbxassetid://99163352872346",
	["croissant"] = "rbxassetid://130710485559420",
	["crop"] = "rbxassetid://116344601101413",["cross"] = "rbxassetid://101833377863588",
	["crosshair"] = "rbxassetid://134242818164054",
	["crown"] = "rbxassetid://127843403295538",
	["cuboid"] = "rbxassetid://75618807946111",
	["cup-soda"] = "rbxassetid://121098640829562",["currency"] = "rbxassetid://90551250119972",
	["cylinder"] = "rbxassetid://90569677179169",
-- D4
	["dam"] = "rbxassetid://76874486231393",
	["database-backup"] = "rbxassetid://103403210984699",
	["database-zap"] = "rbxassetid://131199921258418",
	["database"] = "rbxassetid://126791525623846",
	["decimals-arrow-left"] = "rbxassetid://120198500638749",
	["decimals-arrow-right"] = "rbxassetid://118263047146797",
	["delete"] = "rbxassetid://126279426372342",
	["dessert"] = "rbxassetid://71508133278830",
	["diameter"] = "rbxassetid://97429051503783",
	["diamond-minus"] = "rbxassetid://128989071438290",
	["diamond-percent"] = "rbxassetid://107717860105959",
	["diamond-plus"] = "rbxassetid://134701163723675",
	["diamond"] = "rbxassetid://105846996304890",
	["dice-1"] = "rbxassetid://112650149591038",
	["dice-2"] = "rbxassetid://112278274566793",
	["dice-3"] = "rbxassetid://118526270626312",["dice-4"] = "rbxassetid://113365650364004",
	["dice-5"] = "rbxassetid://72768312430593",
	["dice-6"] = "rbxassetid://85376239182543",
	["dices"] = "rbxassetid://81268120302865",
	["diff"] = "rbxassetid://135052708609715",["disc-2"] = "rbxassetid://91419420404185",
	["disc-3"] = "rbxassetid://135470554736048",
	["disc-album"] = "rbxassetid://74693460404344",
	["disc"] = "rbxassetid://101908120120777",
	["divide"] = "rbxassetid://136678191878278",["dna-off"] = "rbxassetid://89612426361540",
	["dna"] = "rbxassetid://74007982981741",
	["dock"] = "rbxassetid://121997427160252",
	["dog"] = "rbxassetid://71920105558570",
	["dollar-sign"] = "rbxassetid://127320961224019",
	["donut"] = "rbxassetid://72204922742657",["door-closed-locked"] = "rbxassetid://74027613267551",
	["door-closed"] = "rbxassetid://136249099949073",
	["door-open"] = "rbxassetid://91306356501736",
	["dot"] = "rbxassetid://137321056643916",
	["download"] = "rbxassetid://134814648082393",
	["drafting-compass"] = "rbxassetid://99701976182841",
	["drama"] = "rbxassetid://110297795801577",
	["dribbble"] = "rbxassetid://80231809663849",
	["drill"] = "rbxassetid://108644821412796",
	["drone"] = "rbxassetid://117299095794783",
	["droplet-off"] = "rbxassetid://119365002225172",
	["droplet"] = "rbxassetid://100597455015098",["droplets"] = "rbxassetid://140111846025180",
	["drum"] = "rbxassetid://136979060344890",
	["drumstick"] = "rbxassetid://104662462521709",
	["dumbbell"] = "rbxassetid://80277236776212",
-- E5
	["ear-off"] = "rbxassetid://87421916192807",
	["ear"] = "rbxassetid://121894949934209",
	["earth-lock"] = "rbxassetid://88814147073745",
	["earth"] = "rbxassetid://76231597751076",
	["eclipse"] = "rbxassetid://114829622118222",
	["egg-fried"] = "rbxassetid://90622538210545",["egg-off"] = "rbxassetid://92288321309285",
	["egg"] = "rbxassetid://117851493400222",
	["ellipsis-vertical"] = "rbxassetid://117978708573781",
	["ellipsis"] = "rbxassetid://140019550645825",
	["equal-approximately"] = "rbxassetid://105382689698323",["equal-not"] = "rbxassetid://76864449458032",
	["equal"] = "rbxassetid://123467780715624",
	["eraser"] = "rbxassetid://133957773112410",
	["ethernet-port"] = "rbxassetid://75391715149314",
	["euro"] = "rbxassetid://72229646524456",["ev-charger"] = "rbxassetid://97906158859623",
	["expand"] = "rbxassetid://137492887754537",
	["external-link"] = "rbxassetid://129331830773832",
	["eye-closed"] = "rbxassetid://111063268625789",
	["eye-off"] = "rbxassetid://135928786788378",["eye"] = "rbxassetid://100033680381365",
-- F6
	["facebook"] = "rbxassetid://72098528632192",
	["factory"] = "rbxassetid://102170024318039",
	["fan"] = "rbxassetid://78391400440696",
	["fast-forward"] = "rbxassetid://121615540167909",["feather"] = "rbxassetid://91872927606406",
	["fence"] = "rbxassetid://123451565578029",
	["ferris-wheel"] = "rbxassetid://79729205796176",
	["figma"] = "rbxassetid://134182122852301",
	["file-archive"] = "rbxassetid://77018106869967",["file-axis-3d"] = "rbxassetid://133912328009885",
	["file-badge"] = "rbxassetid://74564895394477",
	["file-box"] = "rbxassetid://119264004071690",["file-braces-corner"] = "rbxassetid://77253337986109",
	["file-braces"] = "rbxassetid://95314128621234",
	["file-chart-column-increasing"] = "rbxassetid://134449481172067",["file-chart-column"] = "rbxassetid://82048481252560",
	["file-chart-line"] = "rbxassetid://71954360551345",
	["file-chart-pie"] = "rbxassetid://81072193564497",
	["file-check-corner"] = "rbxassetid://76295552859171",["file-check"] = "rbxassetid://82604001452455",
	["file-clock"] = "rbxassetid://102325208830990",
	["file-code-corner"] = "rbxassetid://78293841184371",
	["file-code"] = "rbxassetid://130978036895504",["file-cog"] = "rbxassetid://101385347151368",
	["file-diff"] = "rbxassetid://96147216772241",
	["file-digit"] = "rbxassetid://89220220354580",
	["file-down"] = "rbxassetid://120650154178290",["file-exclamation-point"] = "rbxassetid://102821865889635",
	["file-headphone"] = "rbxassetid://100533735901986",
	["file-heart"] = "rbxassetid://132214916401696",
	["file-image"] = "rbxassetid://123334057511782",
	["file-input"] = "rbxassetid://124728604166044",
	["file-key"] = "rbxassetid://118790255921100",
	["file-lock"] = "rbxassetid://72170228691242",
	["file-minus-corner"] = "rbxassetid://119263271735124",
	["file-minus"] = "rbxassetid://111014798459222",
	["file-music"] = "rbxassetid://134948051536671",
	["file-output"] = "rbxassetid://92146832572911",["file-pen-line"] = "rbxassetid://104622936345006",
	["file-pen"] = "rbxassetid://79556179730240",
	["file-play"] = "rbxassetid://89006821567838",
	["file-plus-corner"] = "rbxassetid://76544604043974",
	["file-plus"] = "rbxassetid://78881710800060",
	["file-question-mark"] = "rbxassetid://127617422859576",
	["file-scan"] = "rbxassetid://129480105228213",
	["file-search-corner"] = "rbxassetid://90974165234008",["file-search"] = "rbxassetid://97780235974933",
	["file-signal"] = "rbxassetid://122070252538165",
	["file-sliders"] = "rbxassetid://85787771732439",
	["file-spreadsheet"] = "rbxassetid://134501869359270",
	["file-stack"] = "rbxassetid://138929929862605",
	["file-symlink"] = "rbxassetid://91865722036510",
	["file-terminal"] = "rbxassetid://116757454755476",
	["file-text"] = "rbxassetid://90496405707281",["file-type-corner"] = "rbxassetid://124902230275209",
	["file-type"] = "rbxassetid://115272552799361",
	["file-up"] = "rbxassetid://131173039312748",
	["file-user"] = "rbxassetid://99552018455009",["file-video-camera"] = "rbxassetid://81719056173960",
	["file-volume"] = "rbxassetid://111264764438958",
	["file-x-corner"] = "rbxassetid://87554136773609",
	["file-x"] = "rbxassetid://107333775515154",
	["file"] = "rbxassetid://74748492079329",
	["files"] = "rbxassetid://102806336233202",
	["film"] = "rbxassetid://120978945609706",
	["fingerprint"] = "rbxassetid://112173305232811",
	["fire-extinguisher"] = "rbxassetid://111643493006960",
	["fish-off"] = "rbxassetid://89756724887508",
	["fish-symbol"] = "rbxassetid://118475177681618",
	["fish"] = "rbxassetid://124360663785796",
	["flag-off"] = "rbxassetid://112944528856799",
	["flag-triangle-left"] = "rbxassetid://88045221285272",["flag-triangle-right"] = "rbxassetid://108292480304566",
	["flag"] = "rbxassetid://78183383236196",
	["flame-kindling"] = "rbxassetid://139728976917928",
	["flame"] = "rbxassetid://98218034436456",
	["flashlight-off"] = "rbxassetid://79780362871740",["flashlight"] = "rbxassetid://100286985600444",
	["flask-conical-off"] = "rbxassetid://112597970025298",
	["flask-conical"] = "rbxassetid://128406680901165",
	["flask-round"] = "rbxassetid://127508287324940",
	["flip-horizontal-2"] = "rbxassetid://103726993598186",
	["flip-horizontal"] = "rbxassetid://122937530107837",
	["flip-vertical-2"] = "rbxassetid://103836358956328",["flip-vertical"] = "rbxassetid://108003917346888",
	["flower-2"] = "rbxassetid://72934574245145",
	["flower"] = "rbxassetid://86129438272762",
	["focus"] = "rbxassetid://87493973153317",
	["fold-horizontal"] = "rbxassetid://92835712442240",["fold-vertical"] = "rbxassetid://108873727253656",
	["folder-archive"] = "rbxassetid://97312009460206",
	["folder-check"] = "rbxassetid://128492920904557",
	["folder-clock"] = "rbxassetid://111964836738545",
	["folder-closed"] = "rbxassetid://118286209350843",
	["folder-code"] = "rbxassetid://70624096349370",
	["folder-cog"] = "rbxassetid://85299519462846",
	["folder-dot"] = "rbxassetid://138687772725278",
	["folder-down"] = "rbxassetid://118044108459225",["folder-git-2"] = "rbxassetid://101394054141166",
	["folder-git"] = "rbxassetid://121885778095158",
	["folder-heart"] = "rbxassetid://79104747211105",
	["folder-input"] = "rbxassetid://90699920697871",["folder-kanban"] = "rbxassetid://78313285104072",
	["folder-key"] = "rbxassetid://85270407596791",
	["folder-lock"] = "rbxassetid://119201572260567",
	["folder-minus"] = "rbxassetid://85648718999010",["folder-open-dot"] = "rbxassetid://74741494767354",
	["folder-open"] = "rbxassetid://76018996254888",
	["folder-output"] = "rbxassetid://101532447937612",
	["folder-pen"] = "rbxassetid://112770491173911",["folder-plus"] = "rbxassetid://91865663406119",
	["folder-root"] = "rbxassetid://103333751154693",
	["folder-search-2"] = "rbxassetid://71276453442655",
	["folder-search"] = "rbxassetid://110568075123861",["folder-symlink"] = "rbxassetid://127485747227189",
	["folder-sync"] = "rbxassetid://91544602659796",
	["folder-tree"] = "rbxassetid://85577554337861",
	["folder-up"] = "rbxassetid://72008269765857",
	["folder-x"] = "rbxassetid://91699618247635",
	["folder"] = "rbxassetid://80846616596607",
	["folders"] = "rbxassetid://110351216219061",
	["footprints"] = "rbxassetid://139192589041315",
	["forklift"] = "rbxassetid://72030930983101",
	["forward"] = "rbxassetid://97545944739523",
	["frame"] = "rbxassetid://109080612832751",
	["framer"] = "rbxassetid://108384807262391",["frown"] = "rbxassetid://124407301067982",
	["fuel"] = "rbxassetid://106447647274511",
	["fullscreen"] = "rbxassetid://77793665526178",
	["funnel-plus"] = "rbxassetid://100780233821928",
	["funnel-x"] = "rbxassetid://70984385812555",["funnel"] = "rbxassetid://108829540827529",
-- G7
	["gallery-horizontal-end"] = "rbxassetid://74672430161161",
	["gallery-horizontal"] = "rbxassetid://80004001442122",
	["gallery-thumbnails"] = "rbxassetid://136219289862706",
	["gallery-vertical-end"] = "rbxassetid://106461402088317",
	["gallery-vertical"] = "rbxassetid://119299431466725",
	["gamepad-2"] = "rbxassetid://92483947987410",["gamepad-directional"] = "rbxassetid://84342305212226",
	["gamepad"] = "rbxassetid://121607283959010",
	["gauge"] = "rbxassetid://110273524101447",
	["gavel"] = "rbxassetid://78952298198456",
	["gem"] = "rbxassetid://112904952151156",["georgian-lari"] = "rbxassetid://98084432591687",
	["ghost"] = "rbxassetid://113822048130017",
	["gift"] = "rbxassetid://109855212076373",
	["git-branch-minus"] = "rbxassetid://97385010649411",["git-branch-plus"] = "rbxassetid://125944221134316",
	["git-branch"] = "rbxassetid://90490195516649",
	["git-commit-horizontal"] = "rbxassetid://133646041800147",
	["git-commit-vertical"] = "rbxassetid://122098032990350",["git-compare-arrows"] = "rbxassetid://84874426520216",
	["git-compare"] = "rbxassetid://91945124438792",
	["git-fork"] = "rbxassetid://89954992404765",
	["git-graph"] = "rbxassetid://86166832019304",["git-merge"] = "rbxassetid://131833355158059",
	["git-pull-request-arrow"] = "rbxassetid://94507974577439",
	["git-pull-request-closed"] = "rbxassetid://78070600389091",["git-pull-request-create-arrow"] = "rbxassetid://127422677061091",
	["git-pull-request-create"] = "rbxassetid://105929577383926",["git-pull-request-draft"] = "rbxassetid://76173459869943",
	["git-pull-request"] = "rbxassetid://138463010991471",
	["github"] = "rbxassetid://120349554354380",
	["gitlab"] = "rbxassetid://114054627192933",["glass-water"] = "rbxassetid://115526102400988",
	["glasses"] = "rbxassetid://87936407455373",
	["globe-lock"] = "rbxassetid://134065526704402",
	["globe"] = "rbxassetid://114238209622913",
	["goal"] = "rbxassetid://120517954878160",
	["gpu"] = "rbxassetid://95577823614219",["graduation-cap"] = "rbxassetid://93771896340220",
	["grape"] = "rbxassetid://134760640415561",
	["grid-2x2-check"] = "rbxassetid://138468840220821",
	["grid-2x2-plus"] = "rbxassetid://91811610580247",["grid-2x2-x"] = "rbxassetid://72407303981388",
	["grid-2x2"] = "rbxassetid://99050491897640",
	["grid-3x2"] = "rbxassetid://95528684210010",["grid-3x3"] = "rbxassetid://70419024781206",
	["grip-horizontal"] = "rbxassetid://136255899715930",
	["grip-vertical"] = "rbxassetid://137183678565296",
	["grip"] = "rbxassetid://109058783556768",
	["group"] = "rbxassetid://107643418926671",["guitar"] = "rbxassetid://75915531867926",
-- H8
	["ham"] = "rbxassetid://74465607934635",
	["hamburger"] = "rbxassetid://93086916815495",
	["hammer"] = "rbxassetid://83545120140895",
	["hand-coins"] = "rbxassetid://126990543175462",["hand-fist"] = "rbxassetid://83341608917591",
	["hand-grab"] = "rbxassetid://88867162163985",
	["hand-heart"] = "rbxassetid://117507367668412",
	["hand-helping"] = "rbxassetid://89897738419446",
	["hand-metal"] = "rbxassetid://113619498548713",
	["hand-platter"] = "rbxassetid://88594727743168",
	["hand"] = "rbxassetid://130703864968637",
	["handbag"] = "rbxassetid://135675846264061",
	["handshake"] = "rbxassetid://78442115255814",["hard-drive-download"] = "rbxassetid://73913801230614",
	["hard-drive-upload"] = "rbxassetid://85762133615118",
	["hard-drive"] = "rbxassetid://88183305858463",
	["hard-hat"] = "rbxassetid://128050846767382",
	["hash"] = "rbxassetid://82890331678520",["hat-glasses"] = "rbxassetid://101165538224815",
	["haze"] = "rbxassetid://108857561768901",
	["hdmi-port"] = "rbxassetid://103693661037020",
	["heading-1"] = "rbxassetid://118129315662110",["heading-2"] = "rbxassetid://110209069670094",
	["heading-3"] = "rbxassetid://90267885237062",
	["heading-4"] = "rbxassetid://129625620307602",
	["heading-5"] = "rbxassetid://120386663181267",["heading-6"] = "rbxassetid://90959079775093",
	["heading"] = "rbxassetid://129254312067735",
	["headphone-off"] = "rbxassetid://85038251615641",
	["headphones"] = "rbxassetid://118833729589183",
	["headset"] = "rbxassetid://129269236787694",["heart-crack"] = "rbxassetid://110987638564119",
	["heart-handshake"] = "rbxassetid://111483078692002",
	["heart-minus"] = "rbxassetid://96827380163326",
	["heart-off"] = "rbxassetid://89748414415617",["heart-plus"] = "rbxassetid://94877796283249",
	["heart-pulse"] = "rbxassetid://129352925579546",
	["heart"] = "rbxassetid://116559368303288",
	["heater"] = "rbxassetid://140478466880916",
	["helicopter"] = "rbxassetid://111557171735930",
	["hexagon"] = "rbxassetid://127592089339199",
	["highlighter"] = "rbxassetid://77411555641113",
	["history"] = "rbxassetid://123980022019922",
	["hop-off"] = "rbxassetid://103386036934034",
	["hop"] = "rbxassetid://82778923997672",
	["hospital"] = "rbxassetid://105868763850707",
	["hotel"] = "rbxassetid://132283390859718",
	["hourglass"] = "rbxassetid://86160434939203",["house-heart"] = "rbxassetid://136054771868597",
	["house-plug"] = "rbxassetid://71438263712075",
	["house-plus"] = "rbxassetid://118495165208309",
	["house-wifi"] = "rbxassetid://126495519725698",
	["house"] = "rbxassetid://98755624629571",
-- I9
	["ice-cream-bowl"] = "rbxassetid://124867218454386",
	["ice-cream-cone"] = "rbxassetid://90751397288639",["id-card-lanyard"] = "rbxassetid://90761480469224",
	["id-card"] = "rbxassetid://75354294622640",
	["image-down"] = "rbxassetid://78972295741235",
	["image-minus"] = "rbxassetid://101066016918565",
	["image-off"] = "rbxassetid://81934811700938",["image-play"] = "rbxassetid://129501806784210",
	["image-plus"] = "rbxassetid://70391970623917",
	["image-up"] = "rbxassetid://126610009605241",
	["image-upscale"] = "rbxassetid://106963545024679",["images"] = "rbxassetid://79350649395557",
	["import"] = "rbxassetid://116545008906029",
	["inbox"] = "rbxassetid://112591360302868",
	["indian-rupee"] = "rbxassetid://113038778381805",
	["infinity"] = "rbxassetid://98083086936965",
	["info"] = "rbxassetid://124560466474914",
	["inspection-panel"] = "rbxassetid://70905313146088",
	["instagram"] = "rbxassetid://119864798614855",
	["italic"] = "rbxassetid://96220378864282",
	["iteration-ccw"] = "rbxassetid://140221832794083",["iteration-cw"] = "rbxassetid://95534489554662",
-- J10
	["japanese-yen"] = "rbxassetid://106362863465813",
	["joystick"] = "rbxassetid://99416790224739",
-- K11
	["kanban"] = "rbxassetid://125934100055431",
	["kayak"] = "rbxassetid://136107544609389",
	["key-round"] = "rbxassetid://83619031955390",
	["key-square"] = "rbxassetid://94621420033649",
	["key"] = "rbxassetid://96510194465420",
	["keyboard-music"] = "rbxassetid://121058541758636",["keyboard-off"] = "rbxassetid://92466375369772",
	["keyboard"] = "rbxassetid://121474456068237",
-- L12
	["lamp-ceiling"] = "rbxassetid://80032758469141",
	["lamp-desk"] = "rbxassetid://85290686983238",["lamp-floor"] = "rbxassetid://104585881375892",
	["lamp-wall-down"] = "rbxassetid://91271394132073",
	["lamp-wall-up"] = "rbxassetid://132141464337445",
	["lamp"] = "rbxassetid://110730830653382",["land-plot"] = "rbxassetid://96449039620294",
	["landmark"] = "rbxassetid://76885079756393",
	["languages"] = "rbxassetid://90816903776498",
	["laptop-minimal-check"] = "rbxassetid://114352019833865",
	["laptop-minimal"] = "rbxassetid://136705765566068",["laptop"] = "rbxassetid://111387063244975",
	["lasso-select"] = "rbxassetid://105609719912753",
	["lasso"] = "rbxassetid://121072936884007",
	["laugh"] = "rbxassetid://104491311361166",
	["layers-2"] = "rbxassetid://70536710516357",
	["layers"] = "rbxassetid://81973586053257",
	["layout-dashboard"] = "rbxassetid://139929981863901",
	["layout-grid"] = "rbxassetid://81344910161871",
	["layout-list"] = "rbxassetid://87462136296578",
	["layout-panel-left"] = "rbxassetid://125092469751491",
	["layout-panel-top"] = "rbxassetid://91943941515944",
	["layout-template"] = "rbxassetid://115564446417985",
	["leaf"] = "rbxassetid://119951075637174",
	["leafy-green"] = "rbxassetid://105146290493154",
	["lectern"] = "rbxassetid://106166425183862",
	["library-big"] = "rbxassetid://106794530191412",
	["library"] = "rbxassetid://114334671982047",
	["life-buoy"] = "rbxassetid://81168450671956",
	["ligature"] = "rbxassetid://111397873269411",
	["lightbulb-off"] = "rbxassetid://83795722296178",
	["lightbulb"] = "rbxassetid://103871245626488",
	["line-squiggle"] = "rbxassetid://109555164424447",["link-2-off"] = "rbxassetid://76885956296867",
	["link-2"] = "rbxassetid://86072351557466",
	["link"] = "rbxassetid://131607023382430",
	["linkedin"] = "rbxassetid://132842789255788",
	["list-check"] = "rbxassetid://72374358471156",["list-checks"] = "rbxassetid://99809353635593",
	["list-chevrons-down-up"] = "rbxassetid://137409641500711",["list-chevrons-up-down"] = "rbxassetid://81825351389084",
	["list-collapse"] = "rbxassetid://124505247702401",
	["list-end"] = "rbxassetid://77650610048119",
	["list-filter-plus"] = "rbxassetid://96385120752336",["list-filter"] = "rbxassetid://103321376129527",
	["list-indent-decrease"] = "rbxassetid://137879979228193",
	["list-indent-increase"] = "rbxassetid://79051053161201",
	["list-minus"] = "rbxassetid://138507965142671",["list-music"] = "rbxassetid://126380635781840",
	["list-ordered"] = "rbxassetid://83212528113913",
	["list-plus"] = "rbxassetid://112384738137814",
	["list-restart"] = "rbxassetid://91703153577421",["list-start"] = "rbxassetid://84828348299727",
	["list-todo"] = "rbxassetid://132980603752108",
	["list-tree"] = "rbxassetid://97685396239010",
	["list-video"] = "rbxassetid://93648525452489",
	["list-x"] = "rbxassetid://113025303988861",
	["list"] = "rbxassetid://113179976918783",
	["loader-circle"] = "rbxassetid://116535712789945",
	["loader-pinwheel"] = "rbxassetid://108513357940900",
	["loader"] = "rbxassetid://78408734580845",["locate-fixed"] = "rbxassetid://137367361548433",
	["locate-off"] = "rbxassetid://73729216338137",
	["locate"] = "rbxassetid://84467676590391",
	["lock-keyhole-open"] = "rbxassetid://110863509313073",["lock-keyhole"] = "rbxassetid://78672912777756",
	["lock-open"] = "rbxassetid://93597915325122",
	["lock"] = "rbxassetid://134724289526879",
	["log-in"] = "rbxassetid://103768533135201",
	["log-out"] = "rbxassetid://84895399304975",
	["logs"] = "rbxassetid://89772091251787",
	["lollipop"] = "rbxassetid://84681611583044",
	["luggage"] = "rbxassetid://76619236486400",
-- M13
	["magnet"] = "rbxassetid://135162361226972",
	["mail-check"] = "rbxassetid://86921536259917",["mail-minus"] = "rbxassetid://81989813236553",
	["mail-open"] = "rbxassetid://122785416858638",
	["mail-plus"] = "rbxassetid://104886401588341",
	["mail-question-mark"] = "rbxassetid://126540170949819",["mail-search"] = "rbxassetid://135616173775287",
	["mail-warning"] = "rbxassetid://81495303676089",
	["mail-x"] = "rbxassetid://74607841705644",
	["mail"] = "rbxassetid://103945161245599",
	["mailbox"] = "rbxassetid://82765503320335",
	["mails"] = "rbxassetid://90673453450080",
	["map-minus"] = "rbxassetid://129525760577747",
	["map-pin-check-inside"] = "rbxassetid://107130529843809",
	["map-pin-check"] = "rbxassetid://118110914690154",
	["map-pin-house"] = "rbxassetid://80546885029816",
	["map-pin-minus-inside"] = "rbxassetid://79005529692964",
	["map-pin-minus"] = "rbxassetid://74518762643623",["map-pin-off"] = "rbxassetid://82474689391020",
	["map-pin-pen"] = "rbxassetid://113515395277504",
	["map-pin-plus-inside"] = "rbxassetid://134639656514430",
	["map-pin-plus"] = "rbxassetid://91875228967029",
	["map-pin-x-inside"] = "rbxassetid://126235934252379",
	["map-pin-x"] = "rbxassetid://101085273547316",
	["map-pin"] = "rbxassetid://84279202219901",
	["map-pinned"] = "rbxassetid://103963788475034",
	["map-plus"] = "rbxassetid://129388826743495",
	["map"] = "rbxassetid://95107167260947",["mars-stroke"] = "rbxassetid://131973193186828",
	["mars"] = "rbxassetid://111287112372511",
	["martini"] = "rbxassetid://82977695401058",
	["maximize-2"] = "rbxassetid://73085922906397",
	["maximize"] = "rbxassetid://76045941763188",
	["medal"] = "rbxassetid://79016002264450",
	["megaphone-off"] = "rbxassetid://124280774193935",
	["megaphone"] = "rbxassetid://118759541854879",
	["meh"] = "rbxassetid://132197867028557",["memory-stick"] = "rbxassetid://93212591343119",
	["menu"] = "rbxassetid://77021539815611",
	["merge"] = "rbxassetid://126201866476775",
	["message-circle-code"] = "rbxassetid://112865244991651",["message-circle-dashed"] = "rbxassetid://81525157881897",
	["message-circle-heart"] = "rbxassetid://101990756073677",
	["message-circle-more"] = "rbxassetid://92856823884663",
	["message-circle-off"] = "rbxassetid://134955643890328",["message-circle-plus"] = "rbxassetid://106562979649273",
	["message-circle-question-mark"] = "rbxassetid://107700302759934",
	["message-circle-reply"] = "rbxassetid://137071749508334",["message-circle-warning"] = "rbxassetid://119020096067894",
	["message-circle-x"] = "rbxassetid://126843387725536",
	["message-circle"] = "rbxassetid://127255077587058",["message-square-code"] = "rbxassetid://110968863152123",
	["message-square-dashed"] = "rbxassetid://107653455516238",
	["message-square-diff"] = "rbxassetid://75472190472625",["message-square-dot"] = "rbxassetid://127806382463916",
	["message-square-heart"] = "rbxassetid://75612811742074",
	["message-square-lock"] = "rbxassetid://81268215619563",
	["message-square-more"] = "rbxassetid://120139782405970",
	["message-square-off"] = "rbxassetid://99961019005789",
	["message-square-plus"] = "rbxassetid://76934450256199",
	["message-square-quote"] = "rbxassetid://116670768629340",["message-square-reply"] = "rbxassetid://130985622754637",
	["message-square-share"] = "rbxassetid://131017005324026",
	["message-square-text"] = "rbxassetid://94899503194205",["message-square-warning"] = "rbxassetid://138432903962261",
	["message-square-x"] = "rbxassetid://137285463279462",
	["message-square"] = "rbxassetid://83881670383280",
	["messages-square"] = "rbxassetid://97532166733358",["mic-off"] = "rbxassetid://82123034444822",
	["mic-vocal"] = "rbxassetid://99082286164362",
	["mic"] = "rbxassetid://89640799126523",
	["microchip"] = "rbxassetid://73937907669903",
	["microscope"] = "rbxassetid://116875530102782",
	["microwave"] = "rbxassetid://108411735353008",
	["milestone"] = "rbxassetid://101618292325920",
	["milk-off"] = "rbxassetid://72388480962742",
	["milk"] = "rbxassetid://96221903896918",
	["minimize-2"] = "rbxassetid://116269596042539",
	["minimize"] = "rbxassetid://121304296213645",
	["minus"] = "rbxassetid://118026365011536",["monitor-check"] = "rbxassetid://86651948439229",
	["monitor-cloud"] = "rbxassetid://85931096038318",
	["monitor-cog"] = "rbxassetid://94345128715799",
	["monitor-dot"] = "rbxassetid://130394010063680",
	["monitor-down"] = "rbxassetid://97466933743423",
	["monitor-off"] = "rbxassetid://74395526657953",
	["monitor-pause"] = "rbxassetid://76002184067562",
	["monitor-play"] = "rbxassetid://133018824306217",
	["monitor-smartphone"] = "rbxassetid://84335680433378",["monitor-speaker"] = "rbxassetid://81744810060380",
	["monitor-stop"] = "rbxassetid://98708958984757",
	["monitor-up"] = "rbxassetid://96035360858377",
	["monitor-x"] = "rbxassetid://126265210441423",
	["monitor"] = "rbxassetid://72664649203050",
	["moon-star"] = "rbxassetid://82782200506348",
	["moon"] = "rbxassetid://83380517901735",["motorbike"] = "rbxassetid://94580787368233",
	["mountain-snow"] = "rbxassetid://105315495740588",
	["mountain"] = "rbxassetid://73269957566415",
	["mouse-off"] = "rbxassetid://75267871697595",
	["mouse-pointer-2-off"] = "rbxassetid://104701076865632",
	["mouse-pointer-2"] = "rbxassetid://117093892862228",
	["mouse-pointer-ban"] = "rbxassetid://106849413057133",
	["mouse-pointer-click"] = "rbxassetid://107150227368485",
	["mouse-pointer"] = "rbxassetid://72322454962935",
	["mouse"] = "rbxassetid://73096068864710",
	["move-3d"] = "rbxassetid://103365982054003",
	["move-diagonal-2"] = "rbxassetid://117298577948096",
	["move-diagonal"] = "rbxassetid://101433481954184",
	["move-down-left"] = "rbxassetid://102819433534567",
	["move-down-right"] = "rbxassetid://101479760041877",
	["move-down"] = "rbxassetid://70510115135583",["move-horizontal"] = "rbxassetid://88513523439149",
	["move-left"] = "rbxassetid://137614740247980",
	["move-right"] = "rbxassetid://132455779472989",
	["move-up-left"] = "rbxassetid://139079815540148",["move-up-right"] = "rbxassetid://105885140592646",
	["move-up"] = "rbxassetid://84505444262658",
	["move-vertical"] = "rbxassetid://86234730730899",
	["move"] = "rbxassetid://116138709011735",["music-2"] = "rbxassetid://134397426600888",
	["music-3"] = "rbxassetid://94466120066498",
	["music-4"] = "rbxassetid://132459323665838",
	["music"] = "rbxassetid://113343203848535",
-- N14
	["navigation-2-off"] = "rbxassetid://116569611780763",["navigation-2"] = "rbxassetid://81889066747907",
	["navigation-off"] = "rbxassetid://87003270290777",
	["navigation"] = "rbxassetid://79308213542922",
	["network"] = "rbxassetid://127410729922644",
	["newspaper"] = "rbxassetid://123479530460544",
	["nfc"] = "rbxassetid://76822396542242",
	["non-binary"] = "rbxassetid://78442360386235",["notebook-pen"] = "rbxassetid://140380614761023",
	["notebook-tabs"] = "rbxassetid://127371085570083",
	["notebook-text"] = "rbxassetid://93061585217270",
	["notebook"] = "rbxassetid://136132108664987",["notepad-text-dashed"] = "rbxassetid://135793446376219",
	["notepad-text"] = "rbxassetid://93404682958966",
	["nut-off"] = "rbxassetid://78795397311573",
	["nut"] = "rbxassetid://127146410705656",
-- O15["octagon-alert"] = "rbxassetid://140438367956051",
	["octagon-minus"] = "rbxassetid://74720436795421",
	["octagon-pause"] = "rbxassetid://103161463909039",
	["octagon-x"] = "rbxassetid://90498161006311",
	["octagon"] = "rbxassetid://120803515514852",
	["omega"] = "rbxassetid://70414080018786",
	["option"] = "rbxassetid://100776883894054",
	["orbit"] = "rbxassetid://108926136860562",
	["origami"] = "rbxassetid://136020626667101",
-- P16["package-2"] = "rbxassetid://70394974762575",
	["package-check"] = "rbxassetid://102374216055130",
	["package-minus"] = "rbxassetid://114492858789692",
	["package-open"] = "rbxassetid://132890233237818",["package-plus"] = "rbxassetid://129261988138366",
	["package-search"] = "rbxassetid://95465120894145",
	["package-x"] = "rbxassetid://70818501607442",
	["package"] = "rbxassetid://97261141732706",
	["paint-bucket"] = "rbxassetid://124275586663284",["paint-roller"] = "rbxassetid://115248074358348",
	["paintbrush-vertical"] = "rbxassetid://105151296591292",
	["paintbrush"] = "rbxassetid://125572663700289",
	["palette"] = "rbxassetid://86350350950064",
	["panda"] = "rbxassetid://132509022802512",["panel-bottom-close"] = "rbxassetid://74287004071159",
	["panel-bottom-dashed"] = "rbxassetid://131084651621603",
	["panel-bottom-open"] = "rbxassetid://107768659586540",
	["panel-bottom"] = "rbxassetid://132127145048511",
	["panel-left-close"] = "rbxassetid://126579818823552",
	["panel-left-dashed"] = "rbxassetid://75536606374585",
	["panel-left-open"] = "rbxassetid://111075816195767",
	["panel-left-right-dashed"] = "rbxassetid://110100707973959",
	["panel-left"] = "rbxassetid://97419752870313",
	["panel-right-close"] = "rbxassetid://139528655524132",["panel-right-dashed"] = "rbxassetid://94959793877311",
	["panel-right-open"] = "rbxassetid://118114419142794",
	["panel-right"] = "rbxassetid://116365035443156",["panel-top-bottom-dashed"] = "rbxassetid://134737235653344",
	["panel-top-close"] = "rbxassetid://83578325777808",
	["panel-top-dashed"] = "rbxassetid://70522913169237",["panel-top-open"] = "rbxassetid://137959875507454",
	["panel-top"] = "rbxassetid://75838479462875",
	["panels-left-bottom"] = "rbxassetid://72996856149149",
	["panels-right-bottom"] = "rbxassetid://90659068960726",["panels-top-left"] = "rbxassetid://79858853850600",
	["paperclip"] = "rbxassetid://92088291163453",
	["parentheses"] = "rbxassetid://78950955173096",
	["parking-meter"] = "rbxassetid://84652733960568",
	["party-popper"] = "rbxassetid://111626795712193",
	["pause"] = "rbxassetid://74873705394436",
	["paw-print"] = "rbxassetid://112218825427601",
	["pc-case"] = "rbxassetid://122978648019101",
	["pen-line"] = "rbxassetid://109108135755303",["pen-off"] = "rbxassetid://84807123119438",
	["pen-tool"] = "rbxassetid://106145404953445",
	["pen"] = "rbxassetid://72037878096321",
	["pencil-line"] = "rbxassetid://88392917053533",
	["pencil-off"] = "rbxassetid://103330927652832",["pencil-ruler"] = "rbxassetid://110120288284597",
	["pencil"] = "rbxassetid://137986121120732",
	["pentagon"] = "rbxassetid://79184802179890",
	["percent"] = "rbxassetid://130155041032013",
	["person-standing"] = "rbxassetid://125020872044147",
	["philippine-peso"] = "rbxassetid://91173798254675",
	["phone-call"] = "rbxassetid://70555587592860",
	["phone-forwarded"] = "rbxassetid://113269614319737",
	["phone-incoming"] = "rbxassetid://82863576359288",
	["phone-missed"] = "rbxassetid://130156165198376",
	["phone-off"] = "rbxassetid://133318623553383",
	["phone-outgoing"] = "rbxassetid://104576478735825",
	["phone"] = "rbxassetid://128804946640049",["pi"] = "rbxassetid://74936036243146",
	["piano"] = "rbxassetid://85008880789520",
	["pickaxe"] = "rbxassetid://105888023317688",
	["picture-in-picture-2"] = "rbxassetid://112803319544468",["picture-in-picture"] = "rbxassetid://80579597835123",
	["piggy-bank"] = "rbxassetid://79498575790721",
	["pilcrow-left"] = "rbxassetid://103803000849583",
	["pilcrow-right"] = "rbxassetid://104881733911870",["pilcrow"] = "rbxassetid://139512780392871",
	["pill-bottle"] = "rbxassetid://118394692404597",
	["pill"] = "rbxassetid://73280534813448",
	["pin-off"] = "rbxassetid://127696372451750",
	["pin"] = "rbxassetid://120978111007514",["pipette"] = "rbxassetid://133167932934404",
	["pizza"] = "rbxassetid://126964453193501",
	["plane-landing"] = "rbxassetid://122555692211889",
	["plane-takeoff"] = "rbxassetid://117179478829575",
	["plane"] = "rbxassetid://126985561580989",
	["play"] = "rbxassetid://135609604299893",
	["plug-2"] = "rbxassetid://97912386476366",
	["plug-zap"] = "rbxassetid://74506269884055",
	["plug"] = "rbxassetid://99782373064495",
	["plus"] = "rbxassetid://111774323017047",["pocket-knife"] = "rbxassetid://134075428063965",
	["pocket"] = "rbxassetid://136686762542964",
	["podcast"] = "rbxassetid://109577075549215",
	["pointer-off"] = "rbxassetid://95488389312794",
	["pointer"] = "rbxassetid://92615117311099",
	["popcorn"] = "rbxassetid://139446511232750",
	["popsicle"] = "rbxassetid://112696318077073",["pound-sterling"] = "rbxassetid://127482649469130",
	["power-off"] = "rbxassetid://118768311012214",
	["power"] = "rbxassetid://96479131758775",
	["presentation"] = "rbxassetid://106134583757890",
	["printer-check"] = "rbxassetid://130273549443689",
	["printer"] = "rbxassetid://76080649734247",
	["projector"] = "rbxassetid://103281856385283",
	["proportions"] = "rbxassetid://130046855997237",
	["puzzle"] = "rbxassetid://136837798892463",
	["pyramid"] = "rbxassetid://107811442374127",
	["qr-code"] = "rbxassetid://105329945723350",
	["quote"] = "rbxassetid://103271711590001",
-- R17
	["rabbit"] = "rbxassetid://98580518804206",
	["radar"] = "rbxassetid://138528222906635",
	["radiation"] = "rbxassetid://104499586848433",
	["radical"] = "rbxassetid://132758286926047",
	["radio-receiver"] = "rbxassetid://129598303378835",
	["radio-tower"] = "rbxassetid://93958663130054",
	["radio"] = "rbxassetid://85611589536956",
	["radius"] = "rbxassetid://89814505307129",
	["rail-symbol"] = "rbxassetid://134295386306962",
	["rainbow"] = "rbxassetid://132488862841895",
	["rat"] = "rbxassetid://127400975953159",
	["ratio"] = "rbxassetid://126369423897295",
	["receipt-cent"] = "rbxassetid://91557573925201",
	["receipt-euro"] = "rbxassetid://94015722210295",
	["receipt-indian-rupee"] = "rbxassetid://89718170439990",
	["receipt-japanese-yen"] = "rbxassetid://132472560758851",["receipt-pound-sterling"] = "rbxassetid://73934967569625",
	["receipt-russian-ruble"] = "rbxassetid://105164576936853",
	["receipt-swiss-franc"] = "rbxassetid://72503668620116",
	["receipt-text"] = "rbxassetid://138483536013737",["receipt-turkish-lira"] = "rbxassetid://91950765836342",
	["receipt"] = "rbxassetid://77877895901792",
	["rectangle-circle"] = "rbxassetid://100642423153903",
	["rectangle-ellipsis"] = "rbxassetid://112919953980965",
	["rectangle-goggles"] = "rbxassetid://98605436666727",["rectangle-horizontal"] = "rbxassetid://90224199814966",
	["rectangle-vertical"] = "rbxassetid://117277050590967",
	["recycle"] = "rbxassetid://140417023381961",
	["redo-2"] = "rbxassetid://70451039017914",
	["redo-dot"] = "rbxassetid://94252981719732",["redo"] = "rbxassetid://116150342119054",
	["refresh-ccw-dot"] = "rbxassetid://106702246753270",
	["refresh-ccw"] = "rbxassetid://117913330389477",["refresh-cw-off"] = "rbxassetid://140179498843054",
	["refresh-cw"] = "rbxassetid://138133190015277",
	["refrigerator"] = "rbxassetid://102614042652753",
	["regex"] = "rbxassetid://100727200791841",
	["remove-formatting"] = "rbxassetid://112833162022628",
	["repeat-1"] = "rbxassetid://130144534857095",
	["repeat-2"] = "rbxassetid://85927537182704",
	["repeat"] = "rbxassetid://121886242955173",
	["replace-all"] = "rbxassetid://127862728198635",
	["replace"] = "rbxassetid://128404082279430",
	["reply-all"] = "rbxassetid://71723137343562",["reply"] = "rbxassetid://109788633497028",
	["rewind"] = "rbxassetid://95205297521988",
	["ribbon"] = "rbxassetid://94265331526851",
	["rocket"] = "rbxassetid://87412317685854",
	["rocking-chair"] = "rbxassetid://110420269495360",["roller-coaster"] = "rbxassetid://112426178972099",
	["rose"] = "rbxassetid://126336840238769",
	["rotate-3d"] = "rbxassetid://76300551576392",
	["rotate-ccw-key"] = "rbxassetid://74976035240976",["rotate-ccw-square"] = "rbxassetid://90515853170424",
	["rotate-ccw"] = "rbxassetid://110116685948665",
	["rotate-cw-square"] = "rbxassetid://77095448159303",
	["rotate-cw"] = "rbxassetid://84183336178654",
	["route-off"] = "rbxassetid://106350402024079",
	["route"] = "rbxassetid://89968303228953",
	["router"] = "rbxassetid://102130331994471",
	["rows-2"] = "rbxassetid://112556185960101",
	["rows-3"] = "rbxassetid://117215586961375",
	["rows-4"] = "rbxassetid://125646021959055",
	["rss"] = "rbxassetid://131789058984793",
	["ruler-dimension-line"] = "rbxassetid://70673861371412",
	["ruler"] = "rbxassetid://81432445547423",
	["russian-ruble"] = "rbxassetid://126357936542156",
-- S18
	["sailboat"] = "rbxassetid://87110567187540",
	["salad"] = "rbxassetid://128864507821603",
	["sandwich"] = "rbxassetid://104573187458917",
	["satellite-dish"] = "rbxassetid://136742443888305",
	["satellite"] = "rbxassetid://134967053164645",
	["saudi-riyal"] = "rbxassetid://102282769104635",
	["save-all"] = "rbxassetid://116946975799440",
	["save-off"] = "rbxassetid://87085435778560",
	["save"] = "rbxassetid://126116963775616",
	["scale-3d"] = "rbxassetid://72414199620352",
	["scale"] = "rbxassetid://108203682317477",
	["scaling"] = "rbxassetid://122360365318466",
	["scan-barcode"] = "rbxassetid://96889457154761",
	["scan-eye"] = "rbxassetid://99244790601968",
	["scan-face"] = "rbxassetid://109959345069668",
	["scan-heart"] = "rbxassetid://106280819776142",
	["scan-line"] = "rbxassetid://126544908146540",["scan-qr-code"] = "rbxassetid://105409149549927",
	["scan-search"] = "rbxassetid://80009010551347",
	["scan-text"] = "rbxassetid://73702396787766",
	["scan"] = "rbxassetid://123104789658180",
	["school"] = "rbxassetid://76351530290068",["scissors-line-dashed"] = "rbxassetid://122237447974173",
	["scissors"] = "rbxassetid://118665510911274",
	["screen-share-off"] = "rbxassetid://107677572669805",
	["screen-share"] = "rbxassetid://85137895705653",["scroll-text"] = "rbxassetid://97321022666868",
	["scroll"] = "rbxassetid://74072101474951",
	["search-check"] = "rbxassetid://75442076191356",
	["search-code"] = "rbxassetid://117114794592802",
	["search-slash"] = "rbxassetid://96483932261041",["search-x"] = "rbxassetid://137319957522951",
	["search"] = "rbxassetid://121018724060431",
	["section"] = "rbxassetid://91732188298948",
	["send-horizontal"] = "rbxassetid://111734392411664",
	["send-to-back"] = "rbxassetid://75340312862253",["send"] = "rbxassetid://127751956873796",
	["separator-horizontal"] = "rbxassetid://84864453699927",
	["separator-vertical"] = "rbxassetid://84031801478581",
	["server-cog"] = "rbxassetid://138470287250966",
	["server-crash"] = "rbxassetid://132810618000212",
	["server-off"] = "rbxassetid://114048751507723",
	["server"] = "rbxassetid://92188766517878",
	["settings-2"] = "rbxassetid://135684703553372",
	["settings"] = "rbxassetid://80758916183665",
	["shapes"] = "rbxassetid://129989433311409",["share-2"] = "rbxassetid://71210767962065",
	["share"] = "rbxassetid://87340985053299",
	["sheet"] = "rbxassetid://134902122480171",
	["shell"] = "rbxassetid://140212943563599",
	["shield-alert"] = "rbxassetid://114995877719925",["shield-ban"] = "rbxassetid://108765041044649",
	["shield-check"] = "rbxassetid://87354736164608",
	["shield-ellipsis"] = "rbxassetid://114794739892123",
	["shield-half"] = "rbxassetid://117842634172647",
	["shield-minus"] = "rbxassetid://89965059528921",
	["shield-off"] = "rbxassetid://133426959132690",
	["shield-plus"] = "rbxassetid://100664857995498",
	["shield-question-mark"] = "rbxassetid://135722075265150",["shield-user"] = "rbxassetid://124832775645347",
	["shield-x"] = "rbxassetid://73370117343811",
	["shield"] = "rbxassetid://110987169760162",
	["ship-wheel"] = "rbxassetid://130797795829448",
	["ship"] = "rbxassetid://83995100553930",
	["shirt"] = "rbxassetid://106579555405966",
	["shopping-bag"] = "rbxassetid://71885477293226",
	["shopping-basket"] = "rbxassetid://138646411956433",
	["shopping-cart"] = "rbxassetid://128420521375441",
	["shovel"] = "rbxassetid://102465000512056",["shower-head"] = "rbxassetid://75884944024117",
	["shredder"] = "rbxassetid://122125164414463",
	["shrimp"] = "rbxassetid://102625900815307",
	["shrink"] = "rbxassetid://90953687918880",
	["shrub"] = "rbxassetid://127326280714343",
	["shuffle"] = "rbxassetid://132382786975101",
	["sigma"] = "rbxassetid://126884244870899",
	["signal-high"] = "rbxassetid://130436670012270",["signal-low"] = "rbxassetid://73674683500458",
	["signal-medium"] = "rbxassetid://125003021367019",
	["signal-zero"] = "rbxassetid://130045332414754",
	["signal"] = "rbxassetid://78424889355261",
	["signature"] = "rbxassetid://114402748013000",["signpost-big"] = "rbxassetid://115780185675001",
	["signpost"] = "rbxassetid://106584743791433",
	["siren"] = "rbxassetid://134210267818039",
	["skip-back"] = "rbxassetid://70466132711334",["skip-forward"] = "rbxassetid://124844823753990",
	["skull"] = "rbxassetid://137726256442333",
	["slack"] = "rbxassetid://96089719516736",
	["slash"] = "rbxassetid://117792185664263",
	["slice"] = "rbxassetid://95810504278179",
	["sliders-horizontal"] = "rbxassetid://85538382643347",["sliders-vertical"] = "rbxassetid://101190569086853",
	["smartphone-charging"] = "rbxassetid://102837532613995",
	["smartphone-nfc"] = "rbxassetid://82326425754446",
	["smartphone"] = "rbxassetid://96623008834511",
	["smile-plus"] = "rbxassetid://131981881472144",
	["smile"] = "rbxassetid://105880397565283",
	["snail"] = "rbxassetid://70904536548363",
	["snowflake"] = "rbxassetid://101235206534566",
	["soap-dispenser-droplet"] = "rbxassetid://77258480479465",
	["sofa"] = "rbxassetid://114427687218324",
	["solar-panel"] = "rbxassetid://132448188047921",
	["soup"] = "rbxassetid://115092551871618",
	["space"] = "rbxassetid://87072088914178",
	["spade"] = "rbxassetid://131444449466462",
	["sparkle"] = "rbxassetid://111044800239623",
	["sparkles"] = "rbxassetid://138635884129147",
	["speaker"] = "rbxassetid://96227183003618",
	["speech"] = "rbxassetid://87013139446349",
	["spell-check-2"] = "rbxassetid://81556731785534",
	["spell-check"] = "rbxassetid://91913483031334",["spline-pointer"] = "rbxassetid://84842840956804",
	["spline"] = "rbxassetid://129406685807412",
	["split"] = "rbxassetid://105112438805988",
	["spool"] = "rbxassetid://124541981347743",
	["spotlight"] = "rbxassetid://77571742539344",["spray-can"] = "rbxassetid://128372039366326",
	["sprout"] = "rbxassetid://100091687832508",
	["square-activity"] = "rbxassetid://89496630185293",
	["square-arrow-down-left"] = "rbxassetid://108194680296901",
	["square-arrow-down-right"] = "rbxassetid://99403846801050",
	["square-arrow-down"] = "rbxassetid://135962519626588",["square-arrow-left"] = "rbxassetid://111671474549238",
	["square-arrow-out-down-left"] = "rbxassetid://125714881756353",["square-arrow-out-down-right"] = "rbxassetid://89971003001390",
	["square-arrow-out-up-left"] = "rbxassetid://103759986579087",
	["square-arrow-out-up-right"] = "rbxassetid://91221896066807",
	["square-arrow-right"] = "rbxassetid://113920471701361",
	["square-arrow-up-left"] = "rbxassetid://112424670290693",["square-arrow-up-right"] = "rbxassetid://76602291406940",
	["square-arrow-up"] = "rbxassetid://106998604646718",
	["square-asterisk"] = "rbxassetid://89186832353625",["square-bottom-dashed-scissors"] = "rbxassetid://79076980104803",
	["square-chart-gantt"] = "rbxassetid://104034017316411",
	["square-check-big"] = "rbxassetid://115320390907184",["square-check"] = "rbxassetid://134682053539509",
	["square-chevron-down"] = "rbxassetid://91032307924592",
	["square-chevron-left"] = "rbxassetid://73143404829510",
	["square-chevron-right"] = "rbxassetid://90612077729930",["square-chevron-up"] = "rbxassetid://85565910197337",
	["square-code"] = "rbxassetid://81604576616881",
	["square-dashed-bottom-code"] = "rbxassetid://100354801563230",["square-dashed-bottom"] = "rbxassetid://101102319625624",
	["square-dashed-kanban"] = "rbxassetid://90388067649847",
	["square-dashed-mouse-pointer"] = "rbxassetid://121016142178467",["square-dashed-top-solid"] = "rbxassetid://117157577548540",
	["square-dashed"] = "rbxassetid://136905537847606",
	["square-divide"] = "rbxassetid://99894657101970",["square-dot"] = "rbxassetid://116613421354866",
	["square-equal"] = "rbxassetid://110283363706707",
	["square-function"] = "rbxassetid://86075219551088",
	["square-kanban"] = "rbxassetid://114537101260131",["square-library"] = "rbxassetid://73810931222081",
	["square-m"] = "rbxassetid://117662700410577",
	["square-menu"] = "rbxassetid://104067089444415",
	["square-minus"] = "rbxassetid://116764432015770",["square-mouse-pointer"] = "rbxassetid://76141850603920",
	["square-parking-off"] = "rbxassetid://100857293535141",
	["square-parking"] = "rbxassetid://133116656122387",
	["square-pause"] = "rbxassetid://86608552787615",["square-pen"] = "rbxassetid://120239476110475",
	["square-percent"] = "rbxassetid://87111930314567",
	["square-pi"] = "rbxassetid://75383328781618",
	["square-pilcrow"] = "rbxassetid://131854284699367",["square-play"] = "rbxassetid://108186325238481",
	["square-plus"] = "rbxassetid://114713264461873",
	["square-power"] = "rbxassetid://129240437805187",
	["square-radical"] = "rbxassetid://132645931868292",["square-round-corner"] = "rbxassetid://104592745113567",
	["square-scissors"] = "rbxassetid://110601255612411",
	["square-sigma"] = "rbxassetid://113231244246816",
	["square-slash"] = "rbxassetid://105477013908757",["square-split-horizontal"] = "rbxassetid://76095370148660",
	["square-split-vertical"] = "rbxassetid://88589192032058",
	["square-square"] = "rbxassetid://136555087357875",
	["square-stack"] = "rbxassetid://100463396619394",
	["square-star"] = "rbxassetid://94506958703720",
	["square-stop"] = "rbxassetid://80018708472943",
	["square-terminal"] = "rbxassetid://83969264476798",
	["square-user-round"] = "rbxassetid://86484997229302",["square-user"] = "rbxassetid://70771214183445",
	["square-x"] = "rbxassetid://125136183850190",
	["square"] = "rbxassetid://86304921356806",
	["squares-exclude"] = "rbxassetid://102345385822324",
	["squares-intersect"] = "rbxassetid://120869602570119",
	["squares-subtract"] = "rbxassetid://131484650948795",
	["squares-unite"] = "rbxassetid://96673080107843",
	["squircle-dashed"] = "rbxassetid://129936702532522",
	["squircle"] = "rbxassetid://82426632573807",["squirrel"] = "rbxassetid://112864252085343",
	["stamp"] = "rbxassetid://92370779813368",
	["star-half"] = "rbxassetid://117449275562979",
	["star-off"] = "rbxassetid://75742832732503",
	["star"] = "rbxassetid://136141469398409",["step-back"] = "rbxassetid://108672750005121",
	["step-forward"] = "rbxassetid://126131872136145",
	["stethoscope"] = "rbxassetid://122331031702148",
	["sticker"] = "rbxassetid://79938203791608",
	["sticky-note"] = "rbxassetid://111894074643919",["store"] = "rbxassetid://90338129673705",
	["stretch-horizontal"] = "rbxassetid://87665042192343",
	["stretch-vertical"] = "rbxassetid://95265463417122",
	["strikethrough"] = "rbxassetid://103417324549613",
	["subscript"] = "rbxassetid://74553514785183",["sun-dim"] = "rbxassetid://129141645592715",
	["sun-medium"] = "rbxassetid://130278807964710",
	["sun-moon"] = "rbxassetid://75752898854559",
	["sun-snow"] = "rbxassetid://112791898014579",
	["sun"] = "rbxassetid://110150589884127",
	["sunrise"] = "rbxassetid://134705665494098",["sunset"] = "rbxassetid://75904872203588",
	["superscript"] = "rbxassetid://96887696590118",
	["swatch-book"] = "rbxassetid://126786244872453",
	["swiss-franc"] = "rbxassetid://113497920041625",
	["switch-camera"] = "rbxassetid://76841154349737",["sword"] = "rbxassetid://124448418211665",
	["swords"] = "rbxassetid://81872698913435",
	["syringe"] = "rbxassetid://123891270479254",
-- T19
	["table-2"] = "rbxassetid://95751552281545",["table-cells-merge"] = "rbxassetid://95363715175258",
	["table-cells-split"] = "rbxassetid://114799086088649",
	["table-columns-split"] = "rbxassetid://111011625447949",["table-of-contents"] = "rbxassetid://135044763275414",
	["table-properties"] = "rbxassetid://125062886015372",
	["table-rows-split"] = "rbxassetid://96443733673997",
	["table"] = "rbxassetid://109109148250737",["tablet-smartphone"] = "rbxassetid://133680859813404",
	["tablet"] = "rbxassetid://128403991264386",
	["tablets"] = "rbxassetid://80835787970735",
	["tag"] = "rbxassetid://129104970103940",
	["tags"] = "rbxassetid://107179263080798",["tally-1"] = "rbxassetid://115301298241643",
	["tally-2"] = "rbxassetid://110363186864027",
	["tally-3"] = "rbxassetid://97655344572540",
	["tally-4"] = "rbxassetid://102633494371890",["tally-5"] = "rbxassetid://88031817475886",
	["tangent"] = "rbxassetid://123263132981724",
	["target"] = "rbxassetid://87563802520297",
	["telescope"] = "rbxassetid://91755049143647",
	["tent-tree"] = "rbxassetid://76698322463977",
	["tent"] = "rbxassetid://109779587826330",
	["terminal"] = "rbxassetid://106783148545356",["test-tube-diagonal"] = "rbxassetid://75662704378840",
	["test-tube"] = "rbxassetid://98801015650164",
	["test-tubes"] = "rbxassetid://92555361447433",
	["text-align-center"] = "rbxassetid://84051028246390",["text-align-end"] = "rbxassetid://130041738343555",
	["text-align-justify"] = "rbxassetid://80279880143030",
	["text-align-start"] = "rbxassetid://134489585487649",["text-cursor-input"] = "rbxassetid://107551944047171",
	["text-cursor"] = "rbxassetid://115984654447300",
	["text-initial"] = "rbxassetid://129458097472087",
	["text-quote"] = "rbxassetid://139278366448736",
	["text-search"] = "rbxassetid://92345384671606",
	["text-select"] = "rbxassetid://117087320884956",
	["text-wrap"] = "rbxassetid://114804318314018",
	["theater"] = "rbxassetid://108558145549163",["thermometer-snowflake"] = "rbxassetid://121876188028425",
	["thermometer-sun"] = "rbxassetid://106693240074310",
	["thermometer"] = "rbxassetid://106546011492311",
	["thumbs-down"] = "rbxassetid://87794009914015",["thumbs-up"] = "rbxassetid://111137070767020",
	["ticket-check"] = "rbxassetid://105428777212507",
	["ticket-minus"] = "rbxassetid://78966299769328",
	["ticket-percent"] = "rbxassetid://80834774406405",
	["ticket-plus"] = "rbxassetid://110086734392189",
	["ticket-slash"] = "rbxassetid://89045681172265",
	["ticket-x"] = "rbxassetid://88674114109926",
	["ticket"] = "rbxassetid://126527071492145",
	["tickets-plane"] = "rbxassetid://100367018248695",
	["tickets"] = "rbxassetid://135268612687833",
	["timer-off"] = "rbxassetid://110916370767271",
	["timer-reset"] = "rbxassetid://110052125369932",
	["timer"] = "rbxassetid://85473888890506",
	["toggle-left"] = "rbxassetid://85887872573050",["toggle-right"] = "rbxassetid://90411952142550",
	["toilet"] = "rbxassetid://80930782432931",
	["tool-case"] = "rbxassetid://87533537832522",
	["tornado"] = "rbxassetid://88358291515768",
	["torus"] = "rbxassetid://70855707283051",
	["touchpad-off"] = "rbxassetid://78784008075456",["touchpad"] = "rbxassetid://74882354908014",
	["tower-control"] = "rbxassetid://95937619060532",
	["toy-brick"] = "rbxassetid://86293483924633",
	["tractor"] = "rbxassetid://103376704722051",
	["traffic-cone"] = "rbxassetid://74110220470369",
	["train-front-tunnel"] = "rbxassetid://105194827005114",["train-front"] = "rbxassetid://125237934215370",
	["train-track"] = "rbxassetid://77451032453723",
	["tram-front"] = "rbxassetid://93315182364998",
	["transgender"] = "rbxassetid://135530817673639",["trash-2"] = "rbxassetid://109843431391323",
	["trash"] = "rbxassetid://106723740584310",
	["tree-deciduous"] = "rbxassetid://123124389219004",
	["tree-palm"] = "rbxassetid://103846705893963",["tree-pine"] = "rbxassetid://124662547202594",
	["trees"] = "rbxassetid://121203841375919",
	["trello"] = "rbxassetid://130987241149527",
	["trending-down"] = "rbxassetid://139309232226438",
	["trending-up-down"] = "rbxassetid://85083293981691",
	["trending-up"] = "rbxassetid://81819858538839",
	["triangle-alert"] = "rbxassetid://125920361880643",
	["triangle-dashed"] = "rbxassetid://124324079103935",
	["triangle-right"] = "rbxassetid://116930791412791",
	["triangle"] = "rbxassetid://126330486745540",
	["trophy"] = "rbxassetid://131545003268773",
	["truck-electric"] = "rbxassetid://111873446387359",
	["truck"] = "rbxassetid://86662707764771",
	["turkish-lira"] = "rbxassetid://114589876174070",
	["turntable"] = "rbxassetid://129870346487856",
	["turtle"] = "rbxassetid://118295081560334",["tv-minimal-play"] = "rbxassetid://99201833426972",
	["tv-minimal"] = "rbxassetid://100382201729427",
	["tv"] = "rbxassetid://135687724791776",
	["twitch"] = "rbxassetid://71383308134888",
	["twitter"] = "rbxassetid://88791703276842",
	["type-outline"] = "rbxassetid://80108627791690",
	["type"] = "rbxassetid://133543553793564",
-- U20
	["umbrella-off"] = "rbxassetid://72395143739955",
	["umbrella"] = "rbxassetid://127502210274589",
	["underline"] = "rbxassetid://123709229216544",
	["undo-2"] = "rbxassetid://113885292059932",["undo-dot"] = "rbxassetid://132055277744844",
	["undo"] = "rbxassetid://111258459077271",
	["unfold-horizontal"] = "rbxassetid://117128358526398",
	["unfold-vertical"] = "rbxassetid://116593025265499",["ungroup"] = "rbxassetid://106674800451003",
	["university"] = "rbxassetid://84652528263642",["unlink-2"] = "rbxassetid://128131898892572",
	["unlink"] = "rbxassetid://139835795227752",
	["unplug"] = "rbxassetid://90171381619874",
	["upload"] = "rbxassetid://138212042425501",
	["usb"] = "rbxassetid://117230058949613",["user-check"] = "rbxassetid://81775205032725",
	["user-cog"] = "rbxassetid://92795491530865",
	["user-lock"] = "rbxassetid://78892639693821",
	["user-minus"] = "rbxassetid://126976941957511",
	["user-pen"] = "rbxassetid://87445472574836",["user-plus"] = "rbxassetid://118514469915884",
	["user-round-check"] = "rbxassetid://118794737621941",
	["user-round-cog"] = "rbxassetid://78239503290053",["user-round-minus"] = "rbxassetid://98944176636447",
	["user-round-pen"] = "rbxassetid://108155244324878",
	["user-round-plus"] = "rbxassetid://113301899567470",["user-round-search"] = "rbxassetid://71565774381870",
	["user-round-x"] = "rbxassetid://122367980560930",
	["user-round"] = "rbxassetid://136485052187963",
	["user-search"] = "rbxassetid://101335649828115",["user-star"] = "rbxassetid://98777846316000",
	["user-x"] = "rbxassetid://139748155894754",
	["user"] = "rbxassetid://81589895647169",
	["users-round"] = "rbxassetid://103005444008339",
	["users"] = "rbxassetid://115398113982385",["utensils-crossed"] = "rbxassetid://109520762270383",
	["utensils"] = "rbxassetid://139952569804235",
	["utility-pole"] = "rbxassetid://101965541238242",
-- V21
	["variable"] = "rbxassetid://104743088438151",
	["vault"] = "rbxassetid://108049164599845",["vector-square"] = "rbxassetid://86713728565344",
	["vegan"] = "rbxassetid://119489190688082",
	["venetian-mask"] = "rbxassetid://102636443033920",
	["venus-and-mars"] = "rbxassetid://120227752103771",["venus"] = "rbxassetid://82891342220859",
	["vibrate-off"] = "rbxassetid://113446447326246",
	["vibrate"] = "rbxassetid://108330910738733",
	["video-off"] = "rbxassetid://132239189859305",
	["video"] = "rbxassetid://107587444636945",
	["videotape"] = "rbxassetid://114816894323398",
	["view"] = "rbxassetid://118717253976805",
	["voicemail"] = "rbxassetid://134313454010227",
	["volleyball"] = "rbxassetid://83889351124153",["volume-1"] = "rbxassetid://98514588731639",
	["volume-2"] = "rbxassetid://89344380902620",
	["volume-off"] = "rbxassetid://103047478058767",
	["volume-x"] = "rbxassetid://139252359189540",
	["volume"] = "rbxassetid://103236289817396",["vote"] = "rbxassetid://89409762851246",
-- W22
	["wallet-cards"] = "rbxassetid://129728715308337",
	["wallet-minimal"] = "rbxassetid://137800448816116",
	["wallet"] = "rbxassetid://132331555762628",["wallpaper"] = "rbxassetid://74682121235494",
	["wand-sparkles"] = "rbxassetid://82546429942392",
	["wand"] = "rbxassetid://114580617777835",
	["warehouse"] = "rbxassetid://78388887451080",
	["washing-machine"] = "rbxassetid://104194127573858",
	["watch"] = "rbxassetid://130544621618405",
	["waves-ladder"] = "rbxassetid://101808619355514",
	["waves"] = "rbxassetid://96340135183647",
	["waypoints"] = "rbxassetid://102450133666017",
	["webcam"] = "rbxassetid://104148487911129",
	["webhook-off"] = "rbxassetid://96370548093471",["webhook"] = "rbxassetid://112812457747322",
	["weight"] = "rbxassetid://103860559844854",
	["wheat-off"] = "rbxassetid://133294844612307",
	["wheat"] = "rbxassetid://85261952080359",
	["whole-word"] = "rbxassetid://90111083954485",
	["wifi-cog"] = "rbxassetid://110500263326209",["wifi-high"] = "rbxassetid://81954601342139",
	["wifi-low"] = "rbxassetid://138217335635913",
	["wifi-off"] = "rbxassetid://74113634330106",
	["wifi-pen"] = "rbxassetid://91290205064712",
	["wifi-sync"] = "rbxassetid://84043971055177",["wifi-zero"] = "rbxassetid://124286465246123",
	["wifi"] = "rbxassetid://104669375183960",
	["wind-arrow-down"] = "rbxassetid://127753987414870",
	["wind"] = "rbxassetid://114551690399915",["wine-off"] = "rbxassetid://108294164302317",
	["wine"] = "rbxassetid://115743721332829",
	["workflow"] = "rbxassetid://99186544029189",
	["worm"] = "rbxassetid://115752311548091",
	["wrench"] = "rbxassetid://112148279212860",
-- X23
	["x"] = "rbxassetid://110786993356448",
-- Y24
	["youtube"] = "rbxassetid://123663668456341",
-- Z25
	["zap-off"] = "rbxassetid://81385483183652",
	["zap"] = "rbxassetid://130551565616516",
	["zoom-in"] = "rbxassetid://127956924984803",
	["zoom-out"] = "rbxassetid://108334162607319",
}

local ThemePresets = {
    Default = {},
    Midnight = {
        Background = Color3.fromRGB(10, 12, 18),
        Secondary = Color3.fromRGB(18, 22, 32),
        Border = Color3.fromRGB(44, 50, 66),
        Text = Color3.fromRGB(240, 244, 255),
        TextDark = Color3.fromRGB(132, 144, 170),
        TextFade = Color3.fromRGB(30, 34, 45),
        Accent = Color3.fromRGB(136, 92, 255),
        Toggle = {
            Enabled = Color3.fromRGB(136, 92, 255),
            Disabled = Color3.fromRGB(42, 46, 58),
            Circle = Color3.fromRGB(230, 233, 245)
        },
        Notification = {
            Background = Color3.fromRGB(12, 16, 24),
            Border = Color3.fromRGB(44, 50, 66),
            Timer = Color3.fromRGB(136, 92, 255)
        }
    },
    Ocean = {
        Background = Color3.fromRGB(8, 19, 28),
        Secondary = Color3.fromRGB(12, 31, 44),
        Border = Color3.fromRGB(31, 68, 89),
        Text = Color3.fromRGB(232, 247, 255),
        TextDark = Color3.fromRGB(122, 173, 199),
        TextFade = Color3.fromRGB(13, 28, 39),
        Accent = Color3.fromRGB(0, 174, 255),
        Toggle = {
            Enabled = Color3.fromRGB(0, 174, 255),
            Disabled = Color3.fromRGB(25, 52, 66),
            Circle = Color3.fromRGB(230, 245, 255)
        },
        Notification = {
            Background = Color3.fromRGB(10, 27, 38),
            Border = Color3.fromRGB(31, 68, 89),
            Timer = Color3.fromRGB(0, 174, 255)
        }
    },
    Emerald = {
        Background = Color3.fromRGB(10, 18, 14),
        Secondary = Color3.fromRGB(16, 28, 22),
        Border = Color3.fromRGB(38, 62, 49),
        Text = Color3.fromRGB(236, 255, 243),
        TextDark = Color3.fromRGB(130, 170, 145),
        TextFade = Color3.fromRGB(18, 30, 24),
        Accent = Color3.fromRGB(46, 204, 113),
        Toggle = {
            Enabled = Color3.fromRGB(46, 204, 113),
            Disabled = Color3.fromRGB(32, 46, 38),
            Circle = Color3.fromRGB(236, 255, 243)
        },
        Notification = {
            Background = Color3.fromRGB(12, 22, 17),
            Border = Color3.fromRGB(38, 62, 49),
            Timer = Color3.fromRGB(46, 204, 113)
        }
    },
    Crimson = {
        Background = Color3.fromRGB(22, 10, 13),
        Secondary = Color3.fromRGB(34, 16, 21),
        Border = Color3.fromRGB(75, 34, 42),
        Text = Color3.fromRGB(255, 238, 241),
        TextDark = Color3.fromRGB(194, 132, 143),
        TextFade = Color3.fromRGB(36, 14, 19),
        Accent = Color3.fromRGB(255, 82, 111),
        Toggle = {
            Enabled = Color3.fromRGB(255, 82, 111),
            Disabled = Color3.fromRGB(58, 27, 34),
            Circle = Color3.fromRGB(255, 238, 241)
        },
        Notification = {
            Background = Color3.fromRGB(26, 12, 16),
            Border = Color3.fromRGB(75, 34, 42),
            Timer = Color3.fromRGB(255, 82, 111)
        }
    }
}

local s = {
    v0rtexd = {Width = 690, Height = 446},
    Minv0rtexd = {Width = 500, Height = 300},
    Maxv0rtexd = {Width = 1200, Height = 800},
    Toggle = {Width = 38, Height = 21, Circle = 13},
    Button = {Height = 39},
    Slider = {Height = 46},
    Dropdown = {Height = 39, OptionHeight = 30},
    Tab = {Width = 135, Height = 35},
    ColorPicker = {Width = 180, Height = 160},
    Notification = {Width = 220, Height = 70},
    TextBox = {Height = 39, InputWidth = 150}
}

local f = {
    Regular = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold),
    Bold = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold)
}

local textsize = {
    Title = 14,
    Normal = 14,
    Small = 13,
    Tiny = 11
}

local animationspeed = {
    Fast = 0.1,
    Normal = 0.15,
    Slow = 0.2,
    VerySlow = 0.3
}

local function DeepCopyTable(original)
    if type(original) ~= "table" then return original end
    local copy = {}
    for k, v in pairs(original) do
        if type(v) == "table" then copy[k] = DeepCopyTable(v) else copy[k] = v end
    end
    return copy
end

local function DeepMergeTables(t1, t2)
    for k, v in pairs(t2) do
        if type(v) == "table" then
            if type(t1[k]) == "table" then t1[k] = DeepMergeTables(t1[k], v) else t1[k] = DeepCopyTable(v) end
        else
            t1[k] = v
        end
    end
    return t1
end

local Library = {}
Library.__index = Library

local Connections = {}
local NotificationQueue = {}
local NotificationContainer = nil

local function CreateTween(instance, properties, duration, easingStyle, easingDirection)
    local tween = ts:Create(
        instance,
        TweenInfo.new(
            duration or animationspeed.Normal,
            easingStyle or Enum.EasingStyle.Quad,
            easingDirection or Enum.EasingDirection.Out
        ),
        properties
    )
    tween:Play()
    return tween
end

local function CreateInstance(className, properties)
    local instance = Instance.new(className)
    for property, value in pairs(properties) do
        if property ~= "Parent" then
            instance[property] = value
        end
    end
    if properties.Parent then
        instance.Parent = properties.Parent
    end
    return instance
end

local function CreateCorner(parent, radius)
    return CreateInstance("UICorner", {
        CornerRadius = UDim.new(0, radius or 5),
        Parent = parent
    })
end

local function CreateStroke(parent, color, transparency)
    return CreateInstance("UIStroke", {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Color = color or c.Border,
        Transparency = transparency or 0,
        Thickness = 1,
        Parent = parent
    })
end

local function CreatePadding(parent, top, bottom, left, right)
    return CreateInstance("UIPadding", {
        PaddingTop = UDim.new(0, top or 0),
        PaddingBottom = UDim.new(0, bottom or 0),
        PaddingLeft = UDim.new(0, left or 0),
        PaddingRight = UDim.new(0, right or 0),
        Parent = parent
    })
end

local function CreateListLayout(parent, padding, sortOrder, direction)
    return CreateInstance("UIListLayout", {
        Padding = UDim.new(0, padding or 0),
        SortOrder = sortOrder or Enum.SortOrder.LayoutOrder,
        FillDirection = direction or Enum.FillDirection.Vertical,
        Parent = parent
    })
end

local function IsMobileDevice()
    return ui.TouchEnabled and not ui.KeyboardEnabled
end

local function MakeDraggable(frame, handle)
    local dragging = false
    local dragInput, dragStart, startPos
    handle = handle or frame

    local function OnInputBegan(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            local connection
            connection = input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                    if connection then
                        connection:Disconnect()
                    end
                end
            end)
        end
    end

    local function OnInputChanged(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end

    handle.InputBegan:Connect(OnInputBegan)
    handle.InputChanged:Connect(OnInputChanged)

    ui.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)
end

local function DisconnectAll()
    for _, connection in pairs(Connections) do
        if typeof(connection) == "RBXScriptConnection" then
            connection:Disconnect()
        end
    end
    Connections = {}
end

local function GetConfigFolder(configName)
    return "AcrylicConfigs/" .. configName
end

local function EnsureConfigFolder()
    if isfolder and not isfolder("AcrylicConfigs") then
        makefolder("AcrylicConfigs")
    end
end

local function GetAvailableConfigs()
    local configs = {}
    if isfolder and listfiles then
        EnsureConfigFolder()
        local files = listfiles("AcrylicConfigs")
        for _, file in ipairs(files) do
            local name = file:match("AcrylicConfigs/(.+)%.json$") or file:match("AcrylicConfigs\\(.+)%.json$")
            if name then
                table.insert(configs, name)
            end
        end
    end
    return configs
end

local function GetThemePresetNames()
    local themes = {}
    for themeName in pairs(ThemePresets) do
        table.insert(themes, themeName)
    end
    table.sort(themes, function(a, b)
        if a == "Default" then
            return true
        elseif b == "Default" then
            return false
        end
        return a < b
    end)
    return themes
end

local AcrylicBlur = {}
AcrylicBlur.__index = AcrylicBlur

function AcrylicBlur.new(object)
    local self = setmetatable({
        _object = object,
        _folder = nil,
        _root = nil,
        _frame = nil,
        _dof = nil,
        _enabled = true
    }, AcrylicBlur)
    self:_Initialize()
    return self
end

function AcrylicBlur:_CreateDepthOfField()
    local existingDOF = lg:FindFirstChild("AcrylicBlur")
    if existingDOF then
        existingDOF:Destroy()
    end
    local existingBlur = lg:FindFirstChild("AcrylicBlurEffect")
    if existingBlur then
        existingBlur:Destroy()
    end
    
    local dof = CreateInstance("DepthOfFieldEffect", {
        Name = "AcrylicBlur",
        FarIntensity = 0,
        FocusDistance = 0.05,
        InFocusRadius = 0.1,
        NearIntensity = 0.5, 
        Parent = lg
    })
    
    self._dof = dof
    return dof
end

function AcrylicBlur:_CreateFolder()
    local existingFolder = workspace.CurrentCamera:FindFirstChild("AcrylicBlur")
    if existingFolder then
        existingFolder:Destroy()
    end
    self._folder = CreateInstance("Folder", {
        Name = "AcrylicBlur",
        Parent = workspace.CurrentCamera
    })
end

function AcrylicBlur:_CreateRoot()
    local part = CreateInstance("Part", {
        Name = "Root",
        Color = Color3.new(0, 0, 0),
        Material = Enum.Material.Glass,
        Size = Vector3.new(1, 1, 0),
        Anchored = true,
        CanCollide = false,
        CanQuery = false,
        Locked = true,
        CastShadow = false,
        Transparency = 0.95, 
        Parent = self._folder
    })
    CreateInstance("SpecialMesh", {
        MeshType = Enum.MeshType.Brick,
        Parent = part
    })
    self._root = part
end

function AcrylicBlur:_CreateFrame()
    self._frame = CreateInstance("Frame", {
        Size = UDim2.new(1, 0, 1, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        Parent = self._object
    })
end

function AcrylicBlur:_Render(distance)
    distance = distance or 0.001
    local positions = {
        top_left = Vector2.new(),
        top_right = Vector2.new(),
        bottom_right = Vector2.new()
    }

    local function ViewportToWorld(location, dist)
        local ray = workspace.CurrentCamera:ScreenPointToRay(location.X, location.Y)
        return ray.Origin + ray.Direction * dist
    end

    local function GetOffset()
        local viewY = workspace.CurrentCamera.ViewportSize.Y
        return (viewY / 2560) * 24 + 4
    end

    local function UpdatePositions(size, position)
        positions.top_left = position
        positions.top_right = position + Vector2.new(size.X, 0)
        positions.bottom_right = position + size
    end

    local function Update()
        if not self._root or not self._enabled then return end
        local tl = ViewportToWorld(positions.top_left, distance)
        local tr = ViewportToWorld(positions.top_right, distance)
        local br = ViewportToWorld(positions.bottom_right, distance)
        local width = (tr - tl).Magnitude
        local height = (tr - br).Magnitude
        self._root.CFrame = CFrame.fromMatrix(
            (tl + br) / 2,
            workspace.CurrentCamera.CFrame.XVector,
            workspace.CurrentCamera.CFrame.YVector,
            workspace.CurrentCamera.CFrame.ZVector
        )
        self._root.Mesh.Scale = Vector3.new(width, height, 0)
    end

    local function OnChange()
        if not self._enabled then return end
        local offset = GetOffset()
        local size = self._frame.AbsoluteSize - Vector2.new(offset, offset)
        local position = self._frame.AbsolutePosition + Vector2.new(offset / 2, offset / 2)
        UpdatePositions(size, position)
        task.spawn(Update)
    end

    Connections["blur_cframe"] = workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(Update)
    Connections["blur_viewport"] = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(Update)
    Connections["blur_fov"] = workspace.CurrentCamera:GetPropertyChangedSignal("FieldOfView"):Connect(Update)
    Connections["blur_pos"] = self._frame:GetPropertyChangedSignal("AbsolutePosition"):Connect(OnChange)
    Connections["blur_size"] = self._frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(OnChange)
    Connections["blur_render"] = rs.RenderStepped:Connect(Update)
    task.spawn(OnChange)
end

function AcrylicBlur:_Initialize()
    self:_CreateDepthOfField()
    self:_CreateFolder()
    self:_CreateRoot()
    self:_CreateFrame()
    self:_Render(0.001)
end

function AcrylicBlur:SetEnabled(enabled)
    self._enabled = enabled
    if self._root then
        self._root.Transparency = enabled and 0.95 or 1
    end
    if self._dof then
        self._dof.Enabled = enabled
    end
end

function AcrylicBlur:Destroy()
    if self._folder then
        self._folder:Destroy()
    end
    local dof = lg:FindFirstChild("AcrylicBlur")
    if dof then
        dof:Destroy()
    end
    local blur = lg:FindFirstChild("AcrylicBlurEffect")
    if blur then
        blur:Destroy()
    end
end

local function CreateNotificationContainer(screenGui)
    if NotificationContainer then return NotificationContainer end
    NotificationContainer = CreateInstance("Frame", {
        Name = "NotificationContainer",
        BackgroundTransparency = 1,
        Position = UDim2.new(1, -240, 0, 20),
        Size = UDim2.new(0, 220, 1, -40),
        Parent = screenGui
    })
    CreateListLayout(NotificationContainer, 10, Enum.SortOrder.LayoutOrder, Enum.FillDirection.Vertical)
    return NotificationContainer
end

function Library.new(title, configFolder)
    local self = setmetatable({}, Library)
    self.title = title or "Acrylic"
    self.configFolder = configFolder or title or "Acrylic"
    self.theme = DeepCopyTable(c)
    self._currentTheme = "Default"
    self.sections = {}
    self.currentTab = nil
    self.minimized = false
    self._acrylicBlur = nil
    self._keybinds = {}
    self._toggleKey = Enum.KeyCode.RightControl
    self._visible = true
    self._originalHeight = s.v0rtexd.Height
    self._minSize = Vector2.new(s.Minv0rtexd.Width, s.Minv0rtexd.Height)
    self._maxSize = Vector2.new(s.Maxv0rtexd.Width, s.Maxv0rtexd.Height)
    self._mobileToggle = nil
    self._isMobile = IsMobileDevice()
    self._configElements = {}
    self._autoSave = false
    self._currentConfig = "default"
    self:_CreateMainv0rtexd()
    self:_SetupKeybindListener()
    self:_SetupMobileSupport()
    CreateNotificationContainer(self.screenGui)
    return self
end

function Library:_ApplyThemeToInterface()
    if not self.screenGui then return end
    local theme = self.theme

    if self.container then self.container.BackgroundColor3 = theme.Background end
    if self.titleLabel then self.titleLabel.TextColor3 = theme.Text end
    if self._mobileToggle then
        self._mobileToggle.BackgroundColor3 = theme.Background
        self._mobileToggle.ImageColor3 = theme.Text
    end

    for _, descendant in ipairs(self.screenGui:GetDescendants()) do
        if descendant:IsA("Frame") then
            if descendant.Name == "Container" then
                descendant.BackgroundColor3 = theme.Background
            elseif descendant.Name == "Header" or descendant.Name == "Separator" then
                descendant.BackgroundColor3 = theme.Border
            elseif descendant.Name == "Notification" then
                descendant.BackgroundColor3 = theme.Notification.Background
            elseif descendant.Name == "Timer" then
                descendant.BackgroundColor3 = theme.Notification.Timer
            elseif descendant.Name == "SliderFill" then
                descendant.BackgroundColor3 = theme.Accent
            elseif descendant.Name == "Circle" then
                descendant.BackgroundColor3 = theme.Toggle.Circle
            elseif descendant.Name == "SwitchBackground" then
                local circle = descendant:FindFirstChild("Circle")
                local isEnabled = circle and circle.Position.X.Offset > 10
                descendant.BackgroundColor3 = isEnabled and theme.Toggle.Enabled or theme.Toggle.Disabled
            elseif descendant.Name == "KeybindBox"
                or descendant.Name == "TextBoxContainer"
                or descendant.Name == "SelectedDisplay"
                or descendant.Name == "OptionsContainer" then
                descendant.BackgroundColor3 = theme.Secondary
            elseif descendant.Name ~= "ColorPreview"
                and descendant.Name ~= "SVPicker"
                and descendant.Name ~= "HueSlider"
                and descendant.Name ~= "Cursor"
                and descendant.Name ~= "HueCursor"
                and descendant.Name ~= "PickerContainer"
                and (
                    descendant.Name == "Paragraph"
                    or descendant.Name:match("^Button_")
                    or descendant.Name:match("^Toggle_")
                    or descendant.Name:match("^Dropdown_")
                    or descendant.Name:match("^TextBox_")
                    or descendant.Name:match("^Keybind_")
                    or descendant.Name:match("^ColorPicker_")
                    or descendant.Name:match("^Slider_")
                ) then
                descendant.BackgroundColor3 = theme.Secondary
            end
        elseif descendant:IsA("ScrollingFrame") then
            descendant.ScrollBarImageColor3 = theme.Border
        elseif descendant:IsA("TextLabel") or descendant:IsA("TextButton") then
            if descendant.Name == "Description" or descendant.Name == "Content" or descendant.Name == "Label" or descendant.Name == "TabText" then
                if descendant.Name == "TabText" and descendant.Parent and self.currentTab and descendant.Parent.Name ~= self.currentTab.name then
                    descendant.TextColor3 = theme.TextDark
                elseif descendant.Name == "TabText" and descendant.Parent and self.currentTab and descendant.Parent.Name == self.currentTab.name then
                    descendant.TextColor3 = theme.Text
                else
                    descendant.TextColor3 = theme.TextDark
                end
            elseif descendant.Name == "Name" or descendant.Name == "Title" or descendant.Name == "Value" or descendant.Name == "ValueBox" or descendant.Name == "SelectedLabel" or descendant.Name == "KeyLabel" then
                descendant.TextColor3 = theme.Text
            elseif descendant.Parent and descendant.Parent.Name == "OptionsScroll" then
                descendant.TextColor3 = theme.Text
            end
        elseif descendant:IsA("TextBox") then
            descendant.TextColor3 = theme.Text
            descendant.PlaceholderColor3 = theme.TextDark
        elseif descendant:IsA("ImageButton") then
            if descendant.Name == "MobileToggle" then
                descendant.ImageColor3 = theme.Text
            elseif descendant.Name == "Arrow" or descendant.Name == "Resize" or descendant.Name == "Close" then
                descendant.ImageColor3 = theme.TextDark
            end
        elseif descendant:IsA("ImageLabel") then
            if descendant.Name == "Minimize" then
                descendant.ImageColor3 = theme.TextDark
            elseif descendant.Name == "Icon" and descendant.Parent and descendant.Parent.Name == "Notification" then
                descendant.ImageColor3 = theme.Text
            elseif descendant.Name == "Icon" and descendant.Parent and descendant.Parent:IsA("Frame") and descendant.Parent.Name:match("^Button_") then
                descendant.ImageColor3 = theme.Text
            elseif descendant.Name == "Icon" and descendant.Parent and descendant.Parent:IsA("Frame") and descendant.Parent.Name:match("^TextBox_") then
                descendant.ImageColor3 = theme.TextDark
            elseif descendant.Name == "Icon" and descendant.Parent and descendant.Parent.Parent and descendant.Parent.Parent.Name == "TabsContainer" then
                 if self.currentTab and descendant.Parent.Name == self.currentTab.name then
                     descendant.ImageColor3 = theme.Text
                 else
                     descendant.ImageColor3 = theme.TextDark
                 end
            elseif descendant.Name == "Arrow" and descendant.Parent and descendant.Parent.Name == "SelectedDisplay" then
                descendant.ImageColor3 = theme.TextDark
            end
        elseif descendant:IsA("UIStroke") then
            if descendant.Parent and descendant.Parent.Name == "Notification" then
                descendant.Color = theme.Notification.Border
            elseif descendant.Parent and (descendant.Parent.Name == "Cursor" or descendant.Parent.Name == "HueCursor") then
                
            elseif descendant.Parent and descendant.Parent.Parent and descendant.Parent.Parent.Name == "TabsContainer" then
                if self.currentTab and descendant.Parent.Name == self.currentTab.name then
                    descendant.Color = theme.Accent
                else
                    descendant.Color = theme.Border
                end
            else
                descendant.Color = theme.Border
            end
        elseif descendant:IsA("UIGradient") then
            if descendant.Parent and descendant.Parent.Name == "TabText" then
                descendant.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, theme.TextDark),
                    ColorSequenceKeypoint.new(0.65, theme.TextDark),
                    ColorSequenceKeypoint.new(1, theme.TextFade)
                })
            end
        end
    end
end

function Library:GetThemePresets()
    return GetThemePresetNames()
end

function Library:ApplyThemePreset(themeName)
    if type(themeName) ~= "string" or not ThemePresets[themeName] then
        themeName = "Default"
    end

    self._currentTheme = themeName

    if themeName == "Default" then
        self.theme = DeepCopyTable(c)
    else
        self.theme = DeepMergeTables(DeepCopyTable(c), DeepCopyTable(ThemePresets[themeName]))
    end

    self:_ApplyThemeToInterface()
    return true
end

function Library:SetTheme(themeOverrides)
    if type(themeOverrides) ~= "table" then return end
    self.theme = DeepMergeTables(DeepCopyTable(self.theme), themeOverrides)
    self:_ApplyThemeToInterface()
end

function Library:SetAccent(color)
    if typeof(color) ~= "Color3" then return end
    self.theme.Accent = color
    self.theme.Toggle.Enabled = color
    self.theme.Notification.Timer = color
    self:_ApplyThemeToInterface()
end

function Library:Notify(config)
    local theme = self.theme
    local title = config.Title or "Notification"
    local description = config.Description or ""
    local duration = config.Duration or 3
    local icon = config.Icon or "rbxassetid://10709775704"

    local notification = CreateInstance("Frame", {
        Name = "Notification",
        BackgroundColor3 = theme.Notification.Background,
        Position = UDim2.new(1, 20, 0, 0),
        Size = UDim2.new(1, 0, 0, s.Notification.Height),
        ClipsDescendants = true,
        Parent = NotificationContainer
    })
    CreateCorner(notification, 4)
    CreateInstance("UIStroke", {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Color = theme.Notification.Border,
        Thickness = 1.5,
        Parent = notification
    })
    local titleLabel = CreateInstance("TextLabel", {
        Name = "Title",
        FontFace = f.Regular,
        TextColor3 = theme.Text,
        Text = title,
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 14, 0, 16),
        TextSize = textsize.Normal,
        Size = UDim2.new(1, -60, 0, 19),
        Parent = notification
    })
    local descriptionLabel = CreateInstance("TextLabel", {
        Name = "Description",
        FontFace = f.Regular,
        TextColor3 = theme.TextDark,
        Text = description,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 14, 0, 38),
        TextSize = textsize.Normal,
        Size = UDim2.new(1, -60, 0, 19),
        Parent = notification
    })
    local iconImage = CreateInstance("ImageLabel", {
        Name = "Icon",
        BackgroundTransparency = 1,
        Image = icon,
        Position = UDim2.new(1, -33, 0, 23),
        Size = UDim2.new(0, 19, 0, 19),
        Parent = notification
    })
    CreateInstance("UIAspectRatioConstraint", {
        Parent = iconImage
    })
    local timerBar = CreateInstance("Frame", {
        Name = "Timer",
        BackgroundColor3 = theme.Notification.Timer,
        Position = UDim2.new(0, 0, 1, -3),
        Size = UDim2.new(1, 0, 0, 3),
        Parent = notification
    })
    CreateCorner(timerBar, 100)
    CreateTween(notification, {Position = UDim2.new(0, 0, 0, 0)}, 0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    CreateTween(timerBar, {Size = UDim2.new(0, 0, 0, 3)}, duration, Enum.EasingStyle.Linear)
    task.delay(duration, function()
        CreateTween(notification, {Position = UDim2.new(1, 20, 0, 0)}, 0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
        task.wait(0.3)
        notification:Destroy()
    end)
    return notification
end

function Library:_SetupKeybindListener()
    Connections["keybind_listener"] = ui.InputBegan:Connect(function(input, gameProcessed)
        if input.KeyCode == self._toggleKey then
            self:Toggle()
            return
        end
        if gameProcessed then return end
        if input.UserInputType ~= Enum.UserInputType.Keyboard then
            return
        end
        for _, keybindData in pairs(self._keybinds) do
            if input.KeyCode == keybindData.key then
                keybindData.callback()
            end
        end
    end)
end

function Library:Toggle()
    self._visible = not self._visible
    self.container.Visible = self._visible
    
    if self._acrylicBlur then
        self._acrylicBlur:SetEnabled(self._visible)
    end
    
    if self._mobileToggle and self._isMobile then
        self._mobileToggle.Visible = not self._visible
    end
end

function Library:SetToggleKey(keyCode)
    self._toggleKey = keyCode
end

function Library:_SetupMobileSupport()
    if not self._isMobile then
        return
    end

    local theme = self.theme
    local mobileButton = CreateInstance("ImageButton", {
        Name = "MobileToggle",
        Image = "rbxassetid://112235310154264",
        ImageColor3 = theme.Text,
        BackgroundColor3 = theme.Background,
        BackgroundTransparency = 0.1,
        Position = UDim2.new(0, 15, 0.5, -25),
        Size = UDim2.new(0, 50, 0, 50),
        AnchorPoint = Vector2.new(0, 0.5),
        Visible = false,
        ZIndex = 999,
        Parent = self.screenGui
    })
    CreateCorner(mobileButton, 25)
    CreateStroke(mobileButton)
    
    local dragging = false
    local dragStart, startPos
    
    mobileButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = mobileButton.Position
        end
    end)
    
    mobileButton.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            if dragging then
                local delta = input.Position - dragStart
                if delta.Magnitude < 10 then
                    self:Toggle()
                end
            end
            dragging = false
        end
    end)
    
    ui.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
            local delta = input.Position - dragStart
            mobileButton.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)
    
    self._mobileToggle = mobileButton
    mobileButton.Visible = not self._visible
end

function Library:_CreateMainv0rtexd()
    local theme = self.theme
    self.screenGui = CreateInstance("ScreenGui", {
        Name = n,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        ResetOnSpawn = false
    })

    self.container = CreateInstance("Frame", {
        Name = "Container",
        BackgroundColor3 = theme.Background,
        BackgroundTransparency = 0.05,
        Position = UDim2.new(0.5, -s.v0rtexd.Width / 2, 0.5, -s.v0rtexd.Height / 2),
        BorderSizePixel = 0,
        Size = UDim2.new(0, s.v0rtexd.Width, 0, s.v0rtexd.Height),
        ClipsDescendants = false,
        Parent = self.screenGui
    })
    CreateCorner(self.container, 5)
    CreateStroke(self.container)

    self.topBar = CreateInstance("Frame", {
        Name = "TopBar",
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 45),
        Parent = self.container
    })

    self.titleLabel = CreateInstance("TextLabel", {
        Name = "Title",
        FontFace = f.Regular,
        TextColor3 = theme.Text,
        Text = self.title,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0, 10),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextSize = textsize.Title,
        Size = UDim2.new(0, 150, 0, 25),
        Parent = self.topBar
    })

    self:_Createv0rtexdControls()

    CreateInstance("Frame", {
        Name = "Header",
        BackgroundColor3 = theme.Border,
        Position = UDim2.new(0, 0, 0, 45),
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 1),
        Parent = self.container
    })

    self:_CreateContentArea()
    MakeDraggable(self.container, self.topBar)

    local player = plr.LocalPlayer
    self.screenGui.Parent = player:WaitForChild("PlayerGui")
    self._acrylicBlur = AcrylicBlur.new(self.container)
end

function Library:_Createv0rtexdControls()
    local theme = self.theme
    local minimizeBtn = CreateInstance("ImageLabel", {
        Name = "Minimize",
        ImageColor3 = theme.TextDark,
        Image = "rbxassetid://82603981310445",
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, -35, 0, 15),
        Size = UDim2.new(0, 15, 0, 15),
        Parent = self.topBar
    })

    local minimizeClickArea = CreateInstance("TextButton", {
        Name = "TextButton",
        Text = "",
        Rotation = 0.01,
        BackgroundTransparency = 1,
        Size = UDim2.new(0, 21, 0, 15),
        Parent = minimizeBtn
    })

    minimizeClickArea.MouseButton1Click:Connect(function()
        self:_ToggleMinimize()
    end)

    minimizeBtn.MouseEnter:Connect(function()
        CreateTween(minimizeBtn, {ImageColor3 = self.theme.Text}, animationspeed.Fast)
    end)

    minimizeBtn.MouseLeave:Connect(function()
        CreateTween(minimizeBtn, {ImageColor3 = self.theme.TextDark}, animationspeed.Fast)
    end)

    local closeBtn = CreateInstance("ImageButton", {
        Name = "Close",
        ImageColor3 = theme.TextDark,
        Image = "rbxassetid://119943770201674",
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, -10, 0, 15),
        Size = UDim2.new(0, 15, 0, 15),
        Parent = self.topBar
    })

    closeBtn.MouseButton1Click:Connect(function()
        if self._visible then
            self:Toggle()
        end
    end)

    closeBtn.MouseEnter:Connect(function()
        CreateTween(closeBtn, {ImageColor3 = Color3.fromRGB(255, 100, 100)}, animationspeed.Fast)
    end)

    closeBtn.MouseLeave:Connect(function()
        CreateTween(closeBtn, {ImageColor3 = self.theme.TextDark}, animationspeed.Fast)
    end)

    local resizeBtn = CreateInstance("ImageButton", {
        Name = "Resize",
        ImageColor3 = Color3.fromRGB(110, 110, 110),
        Image = "rbxassetid://120997033468887",
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(1, -5, 1, -5),
        Size = UDim2.new(0, 62, 0, 60),
        BorderSizePixel = 0,
        Parent = self.container
    })

    self.resizeBtn = resizeBtn
    self:_SetupSmartResize(resizeBtn)
end

function Library:_CreateContentArea()
    local theme = self.theme
    self.mainContent = CreateInstance("Frame", {
        Name = "MainContent",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0, 46),
        Size = UDim2.new(1, 0, 1, -46),
        ClipsDescendants = true,
        Parent = self.container
    })

    self.sectionsContainer = CreateInstance("ScrollingFrame", {
        Name = "SectionsContainer",
        ScrollBarThickness = 0,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0, 0),
        Size = UDim2.new(0, 165, 1, 0),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        Parent = self.mainContent
    })
    CreateListLayout(self.sectionsContainer, 0, Enum.SortOrder.LayoutOrder)
    CreatePadding(self.sectionsContainer, 5, 5, 5, 5)

    CreateInstance("Frame", {
        Name = "Separator",
        BackgroundColor3 = theme.Border,
        Position = UDim2.new(0, 165, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.new(0, 1, 1, 0),
        Parent = self.mainContent
    })

    self.contentContainer = CreateInstance("ScrollingFrame", {
        Name = "ContentContainer",
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Color3.fromRGB(60, 60, 60),
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 166, 0, 0),
        Size = UDim2.new(1, -166, 1, 0),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        Parent = self.mainContent
    })
    CreateListLayout(self.contentContainer, 8, Enum.SortOrder.LayoutOrder)
    CreatePadding(self.contentContainer, 10, 10, 15, 15)
end

function Library:_SetupSmartResize(handle)
    local resizing = false
    local resizeStart, startSize, startPos

    handle.MouseEnter:Connect(function()
        CreateTween(handle, {ImageColor3 = self.theme.Text}, animationspeed.Fast)
    end)

    handle.MouseLeave:Connect(function()
        if not resizing then
            CreateTween(handle, {ImageColor3 = Color3.fromRGB(110, 110, 110)}, animationspeed.Fast)
        end
    end)

    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            resizing = true
            resizeStart = input.Position
            startSize = self.container.AbsoluteSize
            startPos = self.container.AbsolutePosition
            self._originalHeight = startSize.Y

            local connection
            connection = input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    resizing = false
                    CreateTween(handle, {ImageColor3 = Color3.fromRGB(110, 110, 110)}, animationspeed.Fast)
                    if connection then
                        connection:Disconnect()
                    end
                end
            end)
        end
    end)

    ui.InputChanged:Connect(function(input)
        if resizing and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - resizeStart
            local newWidth = math.clamp(startSize.X + delta.X, self._minSize.X, self._maxSize.X)
            local newHeight = math.clamp(startSize.Y + delta.Y, self._minSize.Y, self._maxSize.Y)
            self.container.Size = UDim2.new(0, newWidth, 0, newHeight)
            self._originalHeight = newHeight
        end
    end)
end

function Library:_ToggleMinimize()
    self.minimized = not self.minimized
    if self.minimized then
        if self._acrylicBlur then
            self._acrylicBlur:SetEnabled(false)
        end
        CreateTween(self.mainContent, {Size = UDim2.new(1, 0, 0, 0)}, animationspeed.Slow)
        CreateTween(self.container, {Size = UDim2.new(0, self.container.AbsoluteSize.X, 0, 45)}, animationspeed.Slow)
        if self.resizeBtn then
            self.resizeBtn.Visible = false
        end
    else
        if self._acrylicBlur then
            self._acrylicBlur:SetEnabled(true)
        end
        CreateTween(self.container, {Size = UDim2.new(0, self.container.AbsoluteSize.X, 0, self._originalHeight)}, animationspeed.Slow)
        task.delay(0.1, function()
            CreateTween(self.mainContent, {Size = UDim2.new(1, 0, 1, -46)}, animationspeed.Normal)
        end)
        if self.resizeBtn then
            self.resizeBtn.Visible = true
        end
    end
end

function Library:Destroy()
    if self._autoSave then
        self:SaveConfig(self._currentConfig)
    end
    
    DisconnectAll()
    if self._acrylicBlur then
        self._acrylicBlur:Destroy()
    end
    if self.screenGui then
        self.screenGui:Destroy()
    end
end

function Library:_RegisterConfigElement(id, elementType, getValue, setValue)
    self._configElements[id] = {
        type = elementType,
        getValue = getValue,
        setValue = setValue
    }
end

function Library:SaveConfig(configName)
    if not writefile then
        self:Notify({
            Title = "Error",
            Description = "Config system not supported",
            Duration = 3
        })
        return false
    end
    
    EnsureConfigFolder()
    
    local configData = {}
    for id, element in pairs(self._configElements) do
        local value = element.getValue()
        
        if typeof(value) == "Color3" then
            value = {R = value.R, G = value.G, B = value.B, _type = "Color3"}
        elseif typeof(value) == "EnumItem" then
            value = {_type = "EnumItem", _enum = tostring(value.EnumType), _value = value.Name}
        end
        
        configData[id] = value
    end
    
    local success, err = pcall(function()
        writefile("AcrylicConfigs/" .. configName .. ".json", hs:JSONEncode(configData))
    end)
    
    if success then
        self._currentConfig = configName
        self:Notify({
            Title = "Config Saved",
            Description = "Saved as: " .. configName,
            Duration = 2,
            Icon = "rbxassetid://10723356507"
        })
        return true
    else
        self:Notify({
            Title = "Error",
            Description = "Failed to save config",
            Duration = 3
        })
        return false
    end
end

function Library:LoadConfig(configName)
    if not readfile or not isfile then
        self:Notify({
            Title = "Error",
            Description = "Config system not supported",
            Duration = 3
        })
        return false
    end
    
    local path = "AcrylicConfigs/" .. configName .. ".json"
    if not isfile(path) then
        self:Notify({
            Title = "Error",
            Description = "Config not found: " .. configName,
            Duration = 3
        })
        return false
    end
    
    local success, data = pcall(function()
        return hs:JSONDecode(readfile(path))
    end)
    
    if not success or not data then
        self:Notify({
            Title = "Error",
            Description = "Failed to load config",
            Duration = 3
        })
        return false
    end
    
    for id, value in pairs(data) do
        if self._configElements[id] then
            if type(value) == "table" and value._type == "Color3" then
                value = Color3.new(value.R, value.G, value.B)
            elseif type(value) == "table" and value._type == "EnumItem" then
                value = Enum[value._enum][value._value]
            end
            
            pcall(function()
                self._configElements[id].setValue(value)
            end)
        end
    end
    
    self._currentConfig = configName
    self:Notify({
        Title = "Config Loaded",
        Description = "Loaded: " .. configName,
        Duration = 2,
        Icon = "rbxassetid://10723356507"
    })
    return true
end

function Library:DeleteConfig(configName)
    if not delfile or not isfile then
        return false
    end
    
    local path = "AcrylicConfigs/" .. configName .. ".json"
    if isfile(path) then
        delfile(path)
        self:Notify({
            Title = "Config Deleted",
            Description = "Deleted: " .. configName,
            Duration = 2
        })
        return true
    end
    return false
end

function Library:GetConfigs()
    return GetAvailableConfigs()
end

function Library:SetAutoSave(enabled)
    self._autoSave = enabled
    if enabled then
        task.spawn(function()
            while self._autoSave and self.screenGui and self.screenGui.Parent do
                task.wait(30)
                if self._autoSave then
                    self:SaveConfig(self._currentConfig)
                end
            end
        end)
    end
end

function Library:CreateSection(name)
    local theme = self.theme
    local section = {
        name = name,
        tabs = {},
        expanded = true,
        _library = self
    }

    local sectionFrame = CreateInstance("Frame", {
        Name = "Section_" .. name,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, -10, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        Parent = self.sectionsContainer
    })
    CreateListLayout(sectionFrame, 2, Enum.SortOrder.LayoutOrder)

    local headerContainer = CreateInstance("Frame", {
        Name = "HeaderContainer",
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 25),
        LayoutOrder = 0,
        Parent = sectionFrame
    })

    local headerBtn = CreateInstance("TextButton", {
        Name = "Header",
        FontFace = f.Regular,
        TextColor3 = theme.TextDark,
        Text = "",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 1, 0),
        Parent = headerContainer
    })

    local headerLabel = CreateInstance("TextLabel", {
        Name = "Label",
        FontFace = f.Regular,
        TextColor3 = theme.TextDark,
        Text = name,
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 5, 0, 0),
        TextSize = textsize.Small,
        Size = UDim2.new(1, -25, 1, 0),
        Parent = headerContainer
    })

    local arrow = CreateInstance("ImageButton", {
        Name = "Arrow",
        Image = "rbxassetid://105558791071013",
        ImageColor3 = theme.TextDark,
        BackgroundTransparency = 1,
        Position = UDim2.new(1, -20, 0.5, -7),
        Size = UDim2.new(0, 15, 0, 15),
        Rotation = 0,
        Parent = headerContainer
    })

    local tabsContainer = CreateInstance("Frame", {
        Name = "TabsContainer",
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        ClipsDescendants = true,
        LayoutOrder = 1,
        Parent = sectionFrame
    })
    CreateListLayout(tabsContainer, 2, Enum.SortOrder.LayoutOrder)
    CreatePadding(tabsContainer, 0, 0, 15, 0)

    local function ToggleSection()
        section.expanded = not section.expanded
        CreateTween(arrow, {Rotation = section.expanded and 0 or 180}, animationspeed.Normal)
        tabsContainer.Visible = section.expanded
    end

    headerBtn.MouseButton1Click:Connect(ToggleSection)
    arrow.MouseButton1Click:Connect(ToggleSection)

    section.frame = sectionFrame
    section.tabsContainer = tabsContainer
    table.insert(self.sections, section)

    local sectionMethods = setmetatable({}, {__index = section})

    function sectionMethods:CreateTab(tabName, icon)
        return Library._CreateTab(self, tabName, icon)
    end

    return sectionMethods
end

local function ResolveIconAsset(icon, defaultIcon)
    if type(icon) ~= "string" or icon == "" then
        return defaultIcon
    end

    if icon:match("^rbxassetid://") or icon:match("^https?://") then
        return icon
    end

    local normalized = icon:lower():gsub("[_%s]+", "-")
    return LucideIcons[icon] or LucideIcons[icon:lower()] or LucideIcons[normalized] or defaultIcon
end

function Library._CreateTab(section, name, icon)
    local theme = section._library.theme
    local tab = {
        name = name,
        elements = {}
    }

    local tabBtn = CreateInstance("Frame", {
        Name = name,
        BackgroundColor3 = theme.Secondary,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.new(0, s.Tab.Width, 0, s.Tab.Height),
        Parent = section.tabsContainer
    })
    CreateCorner(tabBtn, 5)

    local tabStroke = CreateStroke(tabBtn, theme.Border, 1)

    local iconLabel = CreateInstance("ImageLabel", {
        Name = "Icon",
        BackgroundTransparency = 1,
        Image = ResolveIconAsset(icon, "rbxassetid://112235310154264"),
        ImageColor3 = theme.TextDark,
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 11, 0.5, 0),
        Size = UDim2.new(0, 15, 0, 15),
        Parent = tabBtn
    })

    local tabText = CreateInstance("TextLabel", {
        Name = "TabText",
        FontFace = f.Regular,
        TextColor3 = theme.TextDark,
        Text = name,
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 33, 0, 0),
        Size = UDim2.new(1, -42, 1, 0),
        TextSize = textsize.Small,
        Parent = tabBtn
    })

    CreateInstance("UIPadding", {
        PaddingRight = UDim.new(0, 9),
        Parent = tabText
    })

    local textGradient = CreateInstance("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, theme.TextDark),
            ColorSequenceKeypoint.new(0.65, theme.TextDark),
            ColorSequenceKeypoint.new(1, theme.TextFade)
        }),
        Parent = tabText
    })

    local clickBtn = CreateInstance("TextButton", {
        Name = "ClickButton",
        Text = "",
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        Parent = tabBtn
    })

    tab.content = CreateInstance("Frame", {
        Name = name .. "_Content",
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        Visible = false,
        Parent = section._library.contentContainer
    })
    CreateListLayout(tab.content, 8, Enum.SortOrder.LayoutOrder)

    clickBtn.MouseButton1Click:Connect(function()
        Library._SelectTab(section._library, tab, tabBtn, tabStroke, iconLabel, tabText, textGradient)
    end)

    clickBtn.MouseEnter:Connect(function()
        if section._library.currentTab ~= tab then
            CreateTween(tabBtn, {BackgroundTransparency = 0.7}, animationspeed.Fast)
        end
    end)

    clickBtn.MouseLeave:Connect(function()
        if section._library.currentTab ~= tab then
            CreateTween(tabBtn, {BackgroundTransparency = 1}, animationspeed.Fast)
        end
    end)

    tab.button = tabBtn
    tab.stroke = tabStroke
    tab.icon = iconLabel
    tab.textLabel = tabText
    tab.textGradient = textGradient
    tab._library = section._library

    table.insert(section.tabs, tab)

    if not section._library.currentTab then
        Library._SelectTab(section._library, tab, tabBtn, tabStroke, iconLabel, tabText, textGradient)
    end

    local tabMethods = setmetatable({}, {__index = tab})

    function tabMethods:CreateSection(sectionName)
        return Library._CreateContentSection(self, sectionName)
    end

    function tabMethods:CreateParagraph(config)
        return Library._CreateParagraph(self, config)
    end

    function tabMethods:CreateSlider(config)
        return Library._CreateSlider(self, config)
    end

    function tabMethods:CreateButton(config)
        return Library._CreateButton(self, config)
    end

    function tabMethods:CreateToggle(config)
        return Library._CreateToggle(self, config)
    end

    function tabMethods:CreateDropdown(config)
        return Library._CreateDropdown(self, config)
    end

    function tabMethods:CreateKeybind(config)
        return Library._CreateKeybind(self, config, section._library)
    end

    function tabMethods:CreateColorPicker(config)
        return Library._CreateColorPicker(self, config)
    end

    function tabMethods:CreateTextBox(config)
        return Library._CreateTextBox(self, config)
    end

    function tabMethods:CreateConfigSection()
        return Library._CreateConfigSection(self)
    end

    return tabMethods
end

function Library._SelectTab(lib, tab, btn, stroke, icon, textLabel, textGradient)
    if lib.currentTab then
        lib.currentTab.content.Visible = false
        CreateTween(lib.currentTab.button, {BackgroundTransparency = 1}, animationspeed.Fast)
        CreateTween(lib.currentTab.icon, {ImageColor3 = lib.theme.TextDark}, animationspeed.Fast)
        lib.currentTab.stroke.Transparency = 1
        if lib.currentTab.textGradient then
            lib.currentTab.textGradient.Enabled = true
        end
    end
    
    lib.currentTab = tab
    tab.content.Visible = true
    
    CreateTween(btn, {BackgroundTransparency = 1}, animationspeed.Fast)
    CreateTween(icon, {ImageColor3 = lib.theme.Text}, animationspeed.Fast)
    stroke.Transparency = 1  
    
    if textGradient then
        textGradient.Enabled = false
    end
    textLabel.TextColor3 = lib.theme.Text
end

function Library._CreateContentSection(tab, name)
    local theme = tab._library.theme
    local section = CreateInstance("TextLabel", {
        Name = "Section_" .. name,
        FontFace = f.Regular,
        TextColor3 = theme.TextDark,
        Text = name,
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        TextSize = 15,
        Size = UDim2.new(1, 0, 0, 25),
        Parent = tab.content
    })
    return section
end

function Library._CreateParagraph(tab, config)
    local theme = tab._library.theme
    local title = config.Title or "Paragraph"
    local content = config.Content or "Description text here."

    local frame = CreateInstance("Frame", {
        Name = "Paragraph",
        BackgroundColor3 = theme.Secondary,
        BackgroundTransparency = 0.4,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        Parent = tab.content
    })
    CreateCorner(frame, 5)
    CreateStroke(frame)
    CreatePadding(frame, 10, 10, 10, 10)

    local titleLabel = CreateInstance("TextLabel", {
        Name = "Title",
        FontFace = f.Regular,
        TextColor3 = theme.Text,
        Text = title,
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        TextSize = textsize.Normal,
        Size = UDim2.new(1, 0, 0, 20),
        Parent = frame
    })

    local contentLabel = CreateInstance("TextLabel", {
        Name = "Content",
        FontFace = f.Regular,
        TextColor3 = theme.TextDark,
        Text = content,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
        BackgroundTransparency = 1,
        TextSize = textsize.Small,
        Position = UDim2.new(0, 0, 0, 22),
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        Parent = frame
    })

    return {
        SetTitle = function(_, newTitle)
            titleLabel.Text = newTitle
        end,
        SetContent = function(_, newContent)
            contentLabel.Text = newContent
        end
    }
end

function Library._CreateSlider(tab, config)
    local theme = tab._library.theme
    local name = config.Name or "Slider"
    local min = config.Min or 0
    local max = config.Max or 100
    local default = config.Default or 50
    local callback = config.Callback or function() end
    local flag = config.Flag
    local step = config.Step or config.Increment or config.Rounding or 1
    if type(step) ~= "number" or step <= 0 then
        step = 1
    end

    local function GetStepDecimals(stepValue)
        local stepString = string.format("%.10f", stepValue):gsub("0+$", "")
        local decimalPart = stepString:match("%.(%d+)")
        return decimalPart and #decimalPart or 0
    end

    local decimals = GetStepDecimals(step)

    local function SnapValue(value)
        local clamped = math.clamp(tonumber(value) or min, min, max)
        local snapped = min + math.floor(((clamped - min) / step) + 0.5) * step
        return math.clamp(snapped, min, max)
    end

    local function FormatValue(value)
        if decimals <= 0 then
            return tostring(math.floor(value + 0.5))
        end

        local formatted = string.format("%." .. tostring(decimals) .. "f", value)
        return formatted:gsub("(%..-)0+$", "%1"):gsub("%.$", "")
    end

    local currentValue = SnapValue(default)

    local frame = CreateInstance("Frame", {
        Name = "Slider_" .. name,
        BackgroundColor3 = theme.Secondary,
        BackgroundTransparency = 0.4,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, s.Slider.Height),
        Parent = tab.content
    })
    CreateCorner(frame, 5)
    CreateStroke(frame)

    local nameLabel = CreateInstance("TextLabel", {
        Name = "Name",
        FontFace = f.Regular,
        TextColor3 = theme.Text,
        Text = name,
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0, 5),
        TextSize = textsize.Normal,
        Size = UDim2.new(0, 200, 0, 20),
        Parent = frame
    })

    local valueBox = CreateInstance("TextBox", {
        Name = "ValueBox",
        FontFace = f.Regular,
        TextColor3 = theme.Text,
        Text = FormatValue(currentValue),
        TextXAlignment = Enum.TextXAlignment.Right,
        ClearTextOnFocus = false,
        PlaceholderText = FormatValue(currentValue),
        BackgroundTransparency = 1,
        Position = UDim2.new(1, -60, 0, 5),
        TextSize = textsize.Normal,
        Size = UDim2.new(0, 50, 0, 20),
        Parent = frame
    })

    local sliderBg = CreateInstance("Frame", {
        Name = "SliderBackground",
        BackgroundColor3 = Color3.fromRGB(11, 11, 11),
        Position = UDim2.new(0, 10, 0, 29),
        BorderSizePixel = 0,
        Size = UDim2.new(1, -20, 0, 7),
        Parent = frame
    })
    CreateCorner(sliderBg, 100)

    local sliderFill = CreateInstance("Frame", {
        Name = "SliderFill",
        BackgroundColor3 = theme.Accent,
        BorderSizePixel = 0,
        Size = UDim2.new(max ~= min and ((currentValue - min) / (max - min)) or 0, 0, 1, 0),
        Parent = sliderBg
    })
    CreateCorner(sliderFill, 100)

    local dragging = false

    local function ApplyValue(value, shouldTween)
        currentValue = SnapValue(value)
        local relativeX = max ~= min and ((currentValue - min) / (max - min)) or 0

        if shouldTween then
            CreateTween(sliderFill, {Size = UDim2.new(relativeX, 0, 1, 0)}, 0.05)
        else
            sliderFill.Size = UDim2.new(relativeX, 0, 1, 0)
        end

        valueBox.Text = FormatValue(currentValue)
        callback(currentValue)
    end

    local function UpdateSlider(input)
        local pos = input.Position
        local framePos = sliderBg.AbsolutePosition
        local frameSize = sliderBg.AbsoluteSize
        local relativeX = math.clamp((pos.X - framePos.X) / frameSize.X, 0, 1)
        local rawValue = min + (max - min) * relativeX
        ApplyValue(rawValue, true)
    end

    sliderBg.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            UpdateSlider(input)
        end
    end)

    sliderBg.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    ui.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            UpdateSlider(input)
        end
    end)

    valueBox.FocusLost:Connect(function()
        local typedValue = tonumber(valueBox.Text)
        if typedValue then
            ApplyValue(typedValue, false)
        else
            valueBox.Text = FormatValue(currentValue)
        end
    end)

    local methods = {
        SetValue = function(_, value)
            ApplyValue(value, false)
        end,
        GetValue = function()
            return currentValue
        end
    }

    if flag and tab._library then
        tab._library:_RegisterConfigElement(flag, "Slider", 
            function() return currentValue end,
            function(value) methods:SetValue(value) end
        )
    end

    return methods
end

function Library._CreateButton(tab, config)
    local theme = tab._library.theme
    local name = config.Name or "Button"
    local callback = config.Callback or function() end

    local frame = CreateInstance("Frame", {
        Name = "Button_" .. name,
        BackgroundColor3 = theme.Secondary,
        BackgroundTransparency = 0.4,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, s.Button.Height),
        Parent = tab.content
    })
    CreateCorner(frame, 5)
    CreateStroke(frame)

    local nameLabel = CreateInstance("TextLabel", {
        Name = "Name",
        FontFace = f.Regular,
        TextColor3 = theme.Text,
        Text = name,
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0.5, -10),
        TextSize = textsize.Normal,
        Size = UDim2.new(0, 200, 0, 20),
        Parent = frame
    })

    local icon = CreateInstance("ImageLabel", {
        Name = "Icon",
        BackgroundTransparency = 1,
        Image = "rbxassetid://10734898355",
        ImageColor3 = theme.Text,
        Position = UDim2.new(1, -30, 0.5, -10),
        Size = UDim2.new(0, 20, 0, 20),
        Parent = frame
    })
    CreateInstance("UIAspectRatioConstraint", {
        Parent = icon
    })

    local button = CreateInstance("TextButton", {
        Name = "Button",
        Text = "",
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        Parent = frame
    })

    button.MouseButton1Click:Connect(function()
        CreateTween(frame, {BackgroundTransparency = 0.2}, animationspeed.Fast)
        task.wait(0.1)
        CreateTween(frame, {BackgroundTransparency = 0.4}, animationspeed.Fast)
        callback()
    end)

    return {
        SetText = function(_, text)
            nameLabel.Text = text
        end
    }
end

function Library._CreateToggle(tab, config)
    local theme = tab._library.theme
    local name = config.Name or "Toggle"
    local default = config.Default or false
    local callback = config.Callback or function() end
    local flag = config.Flag
    local enabled = default

    local frame = CreateInstance("Frame", {
        Name = "Toggle_" .. name,
        BackgroundColor3 = theme.Secondary,
        BackgroundTransparency = 0.4,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, s.Button.Height),
        Parent = tab.content
    })
    CreateCorner(frame, 5)
    CreateStroke(frame)

    local nameLabel = CreateInstance("TextLabel", {
        Name = "Name",
        FontFace = f.Regular,
        TextColor3 = theme.Text,
        Text = name,
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0.5, -10),
        TextSize = textsize.Normal,
        Size = UDim2.new(0, 200, 0, 20),
        Parent = frame
    })

    local switchBg = CreateInstance("Frame", {
        Name = "SwitchBackground",
        BackgroundColor3 = enabled and theme.Toggle.Enabled or theme.Toggle.Disabled,
        Position = UDim2.new(1, -48, 0.5, -10),
        BorderSizePixel = 0,
        Size = UDim2.new(0, s.Toggle.Width, 0, s.Toggle.Height),
        Parent = frame
    })
    CreateCorner(switchBg, 100)

    local switchCircle = CreateInstance("Frame", {
        Name = "Circle",
        BackgroundColor3 = theme.Toggle.Circle,
        AnchorPoint = Vector2.new(0, 0.5),
        Position = enabled and UDim2.new(0, 21, 0.5, 0) or UDim2.new(0, 4, 0.5, 0),
        BorderSizePixel = 0,
        Size = UDim2.new(0, s.Toggle.Circle, 0, s.Toggle.Circle),
        Parent = switchBg
    })
    CreateCorner(switchCircle, 100)

    local toggleBtn = CreateInstance("TextButton", {
        Name = "ToggleButton",
        Text = "",
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        Parent = switchCircle
    })

    local button = CreateInstance("TextButton", {
        Name = "Button",
        Text = "",
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        Parent = frame
    })

    local function UpdateToggle()
        local activeTheme = tab._library.theme
        if enabled then
            CreateTween(switchBg, {BackgroundColor3 = activeTheme.Toggle.Enabled}, animationspeed.Normal)
            CreateTween(switchCircle, {Position = UDim2.new(0, 21, 0.5, 0)}, animationspeed.Normal)
        else
            CreateTween(switchBg, {BackgroundColor3 = activeTheme.Toggle.Disabled}, animationspeed.Normal)
            CreateTween(switchCircle, {Position = UDim2.new(0, 4, 0.5, 0)}, animationspeed.Normal)
        end
    end

    button.MouseButton1Click:Connect(function()
        enabled = not enabled
        UpdateToggle()
        callback(enabled)
    end)

    local methods = {
        SetValue = function(_, value)
            enabled = value
            UpdateToggle()
            callback(enabled)
        end,
        GetValue = function()
            return enabled
        end
    }

    if flag and tab._library then
        tab._library:_RegisterConfigElement(flag, "Toggle", 
            function() return enabled end,
            function(value) methods:SetValue(value) end
        )
    end

    return methods
end

function Library._CreateDropdown(tab, config)
    local theme = tab._library.theme
    local name = config.Name or "Dropdown"
    local options = config.Options or {"Option 1", "Option 2", "Option 3"}
    local default = config.Default or options[1]
    local multiSelect = config.MultiSelect or false
    local callback = config.Callback or function() end
    local flag = config.Flag
    local selected = multiSelect and {} or default
    local expanded = false

    if multiSelect and type(default) == "table" then
        selected = default
    elseif multiSelect then
        selected = {}
    end

    local frame = CreateInstance("Frame", {
        Name = "Dropdown_" .. name,
        BackgroundColor3 = theme.Secondary,
        BackgroundTransparency = 0.4,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, s.Dropdown.Height),
        ClipsDescendants = false,
        ZIndex = 1,
        Parent = tab.content
    })
    CreateCorner(frame, 5)
    CreateStroke(frame)

    local nameLabel = CreateInstance("TextLabel", {
        Name = "Name",
        FontFace = f.Regular,
        TextColor3 = theme.Text,
        Text = name,
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0, 10),
        TextSize = textsize.Normal,
        Size = UDim2.new(0, 200, 0, 20),
        ZIndex = 1,
        Parent = frame
    })

    local selectedDisplay = CreateInstance("Frame", {
        Name = "SelectedDisplay",
        BackgroundColor3 = theme.Secondary,
        BackgroundTransparency = 0.04,
        Position = UDim2.new(1, -145, 0, 6),
        BorderSizePixel = 0,
        Size = UDim2.new(0, 135, 0, 26),
        ZIndex = 2,
        Parent = frame
    })
    CreateCorner(selectedDisplay, 5)
    CreateStroke(selectedDisplay)

    local selectedLabel = CreateInstance("TextLabel", {
        Name = "SelectedLabel",
        FontFace = f.Regular,
        TextColor3 = theme.Text,
        Text = multiSelect and (#selected > 0 and table.concat(selected, ", ") or "None") or tostring(selected),
        TextTruncate = Enum.TextTruncate.AtEnd,
        BackgroundTransparency = 1,
        TextSize = textsize.Small,
        Size = UDim2.new(1, -30, 1, 0),
        Position = UDim2.new(0, 10, 0, 0),
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 2,
        Parent = selectedDisplay
    })

    local arrow = CreateInstance("ImageLabel", {
        Name = "Arrow",
        Image = "rbxassetid://105558791071013",
        ImageColor3 = theme.TextDark,
        BackgroundTransparency = 1,
        Position = UDim2.new(1, -20, 0.5, -5),
        Size = UDim2.new(0, 10, 0, 10),
        Rotation = 0,
        ZIndex = 2,
        Parent = selectedDisplay
    })

    local maxVisibleOptions = 5
    local totalOptionsHeight = math.min(#options * s.Dropdown.OptionHeight, maxVisibleOptions * s.Dropdown.OptionHeight)

    local optionsContainer = CreateInstance("Frame", {
        Name = "OptionsContainer",
        BackgroundColor3 = theme.Secondary,
        BackgroundTransparency = 0.04,
        Position = UDim2.new(1, -145, 0, 38),
        BorderSizePixel = 0,
        Size = UDim2.new(0, 135, 0, totalOptionsHeight),
        Visible = false,
        ZIndex = 100,
        ClipsDescendants = true,
        Parent = frame
    })
    CreateCorner(optionsContainer, 5)
    CreateStroke(optionsContainer)

    local optionsScroll = CreateInstance("ScrollingFrame", {
        Name = "OptionsScroll",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 1, 0),
        CanvasSize = UDim2.new(0, 0, 0, #options * s.Dropdown.OptionHeight),
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Color3.fromRGB(60, 60, 60),
        ZIndex = 100,
        Parent = optionsContainer
    })
    CreateListLayout(optionsScroll, 0, Enum.SortOrder.LayoutOrder)

    local function UpdateSelectedText()
        if multiSelect then
            selectedLabel.Text = #selected > 0 and table.concat(selected, ", ") or "None"
        else
            selectedLabel.Text = tostring(selected)
        end
    end

    local function CreateOptionButton(option)
        local optionBtn = CreateInstance("TextButton", {
            Name = option,
            FontFace = f.Regular,
            TextColor3 = tab._library.theme.Text,
            Text = option,
            BackgroundColor3 = Color3.fromRGB(30, 30, 30),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextSize = textsize.Small,
            Size = UDim2.new(1, 0, 0, s.Dropdown.OptionHeight),
            ZIndex = 100,
            Parent = optionsScroll
        })

        optionBtn.MouseEnter:Connect(function()
            CreateTween(optionBtn, {BackgroundTransparency = 0.5}, animationspeed.Fast)
        end)

        optionBtn.MouseLeave:Connect(function()
            CreateTween(optionBtn, {BackgroundTransparency = 1}, animationspeed.Fast)
        end)

        optionBtn.MouseButton1Click:Connect(function()
            if multiSelect then
                local index = table.find(selected, option)
                if index then
                    table.remove(selected, index)
                else
                    table.insert(selected, option)
                end
                UpdateSelectedText()
                callback(selected)
            else
                selected = option
                UpdateSelectedText()
                callback(selected)
                expanded = false
                optionsContainer.Visible = false
                CreateTween(arrow, {Rotation = 0}, animationspeed.Normal)
                frame.ZIndex = 1
            end
        end)

        return optionBtn
    end

    for _, option in ipairs(options) do
        CreateOptionButton(option)
    end

    local toggleBtn = CreateInstance("TextButton", {
        Name = "ToggleBtn",
        Text = "",
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        ZIndex = 3,
        Parent = selectedDisplay
    })

    toggleBtn.MouseButton1Click:Connect(function()
        expanded = not expanded
        optionsContainer.Visible = expanded
        CreateTween(arrow, {Rotation = expanded and 180 or 0}, animationspeed.Normal)
        frame.ZIndex = expanded and 10 or 1
    end)

    local methods = {
        SetValue = function(_, value)
            if multiSelect and type(value) == "table" then
                selected = value
            elseif not multiSelect then
                selected = value
            end
            UpdateSelectedText()
            callback(selected)
        end,
        GetValue = function()
            return selected
        end,
        Refresh = function(_, newOptions)
            options = newOptions
            for _, child in ipairs(optionsScroll:GetChildren()) do
                if child:IsA("TextButton") then
                    child:Destroy()
                end
            end
            for _, option in ipairs(options) do
                CreateOptionButton(option)
            end
            optionsScroll.CanvasSize = UDim2.new(0, 0, 0, #options * s.Dropdown.OptionHeight)
            local newTotalHeight = math.min(#options * s.Dropdown.OptionHeight, maxVisibleOptions * s.Dropdown.OptionHeight)
            optionsContainer.Size = UDim2.new(0, 135, 0, newTotalHeight)
        end
    }

    if flag and tab._library then
        tab._library:_RegisterConfigElement(flag, "Dropdown", 
            function() return selected end,
            function(value) methods:SetValue(value) end
        )
    end

    return methods
end

function Library._CreateKeybind(tab, config, lib)
    local theme = tab._library.theme
    local name = config.Name or "Keybind"
    local default = config.Default or Enum.KeyCode.F
    local callback = config.Callback or function() end
    local flag = config.Flag
    local currentKey = default
    local listening = false

    local frame = CreateInstance("Frame", {
        Name = "Keybind_" .. name,
        BackgroundColor3 = theme.Secondary,
        BackgroundTransparency = 0.4,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, s.Button.Height),
        Parent = tab.content
    })
    CreateCorner(frame, 5)
    CreateStroke(frame)

    local nameLabel = CreateInstance("TextLabel", {
        Name = "Name",
        FontFace = f.Regular,
        TextColor3 = theme.Text,
        Text = name,
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0.5, -10),
        TextSize = textsize.Normal,
        Size = UDim2.new(0, 200, 0, 20),
        Parent = frame
    })

    local keybindBox = CreateInstance("Frame", {
        Name = "KeybindBox",
        BackgroundColor3 = theme.Secondary,
        BackgroundTransparency = 0.04,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -10, 0.5, 0),
        BorderSizePixel = 0,
        Size = UDim2.new(0, 30, 0, 26),
        Parent = frame
    })
    CreateCorner(keybindBox, 5)
    CreateStroke(keybindBox)

    local keyLabel = CreateInstance("TextLabel", {
        Name = "KeyLabel",
        FontFace = f.Regular,
        TextColor3 = theme.Text,
        Text = currentKey.Name,
        BackgroundTransparency = 1,
        TextSize = textsize.Normal,
        Size = UDim2.new(1, 0, 1, 0),
        Parent = keybindBox
    })

    local button = CreateInstance("TextButton", {
        Name = "Button",
        Text = "",
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        Parent = keybindBox
    })

    local keybindId = name .. "_" .. tostring(tick())

    lib._keybinds[keybindId] = {
        key = currentKey,
        callback = callback
    }

    local function UpdateKeyDisplay()
        if listening then
            keyLabel.Text = "..."
            keybindBox.Size = UDim2.new(0, 43, 0, 26)
        else
            local keyName = currentKey.Name
            local textWidth = math.max(#keyName * 9 + 10, 24)
            keybindBox.Size = UDim2.new(0, textWidth, 0, 26)
            keyLabel.Text = keyName
        end
    end

    button.MouseButton1Click:Connect(function()
        listening = true
        UpdateKeyDisplay()
    end)

    local inputConnection
    inputConnection = ui.InputBegan:Connect(function(input, gameProcessed)
        if listening and input.UserInputType == Enum.UserInputType.Keyboard then
            currentKey = input.KeyCode
            listening = false
            lib._keybinds[keybindId].key = currentKey
            UpdateKeyDisplay()
            callback(currentKey)
        end
    end)

    table.insert(Connections, inputConnection)
    UpdateKeyDisplay()

    local methods = {
        SetKey = function(_, keyCode)
            currentKey = keyCode
            lib._keybinds[keybindId].key = currentKey
            UpdateKeyDisplay()
            callback(currentKey)
        end,
        GetKey = function()
            return currentKey
        end
    }

    if flag and lib then
        lib:_RegisterConfigElement(flag, "Keybind", 
            function() return currentKey end,
            function(value) methods:SetKey(value) end
        )
    end

    return methods
end

function Library._CreateColorPicker(tab, config)
    local theme = tab._library.theme
    local name = config.Name or "Color Picker"
    local default = config.Default or Color3.fromRGB(255, 255, 255)
    local callback = config.Callback or function() end
    local flag = config.Flag
    local currentColor = default
    local hue, sat, val = currentColor:ToHSV()
    local expanded = false

    local frame = CreateInstance("Frame", {
        Name = "ColorPicker_" .. name,
        BackgroundColor3 = theme.Secondary,
        BackgroundTransparency = 0.4,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, s.Button.Height),
        Parent = tab.content
    })
    CreateCorner(frame, 6)
    CreateStroke(frame)

    local nameLabel = CreateInstance("TextLabel", {
        Name = "Name",
        FontFace = f.Regular,
        TextColor3 = theme.Text,
        Text = name,
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0, 0),
        TextSize = textsize.Normal,
        Size = UDim2.new(1, -50, 1, 0),
        Parent = frame
    })

    local colorPreview = CreateInstance("Frame", {
        Name = "ColorPreview",
        BackgroundColor3 = currentColor,
        Position = UDim2.new(1, -45, 0.5, -8),
        Size = UDim2.new(0, 35, 0, 16),
        ZIndex = 2,
        Parent = frame
    })
    CreateCorner(colorPreview, 4)
    CreateStroke(colorPreview)

    local previewBtn = CreateInstance("TextButton", {
        Text = "",
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        ZIndex = 3,
        Parent = colorPreview
    })

    local pickerContainer = CreateInstance("Frame", {
        Name = "PickerContainer",
        BackgroundColor3 = Color3.fromRGB(20, 20, 20),
        BorderSizePixel = 0,
        Size = UDim2.new(0, 160, 0, 115),
        Visible = false,
        ZIndex = 3000,
        Parent = tab.content:FindFirstAncestorOfClass("ScreenGui") or tab.content
    })
    CreateCorner(pickerContainer, 6)

    local containerStroke = CreateInstance("UIStroke", {
        Color = Color3.fromRGB(40, 40, 40),
        Thickness = 1,
        Parent = pickerContainer
    })

    local svPicker = CreateInstance("Frame", {
        Name = "SVPicker",
        BackgroundColor3 = Color3.fromHSV(hue, 1, 1),
        Position = UDim2.new(0, 8, 0, 8),
        Size = UDim2.new(1, -16, 0, 85),
        ZIndex = 3001,
        Parent = pickerContainer
    })
    CreateCorner(svPicker, 4)

    local whiteLayer = CreateInstance("Frame", {
        BackgroundColor3 = Color3.new(1, 1, 1),
        Size = UDim2.new(1, 0, 1, 0),
        ZIndex = 3002,
        Parent = svPicker
    })
    CreateCorner(whiteLayer, 4)

    local whiteGrad = CreateInstance("UIGradient", {
        Color = ColorSequence.new(Color3.new(1, 1, 1)),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(1, 1)
        }),
        Parent = whiteLayer
    })

    local blackLayer = CreateInstance("Frame", {
        BackgroundColor3 = Color3.new(0, 0, 0),
        Size = UDim2.new(1, 0, 1, 0),
        ZIndex = 3003,
        Parent = svPicker
    })
    CreateCorner(blackLayer, 4)

    local blackGrad = CreateInstance("UIGradient", {
        Color = ColorSequence.new(Color3.new(0, 0, 0)),
        Rotation = 90,
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(1, 0)
        }),
        Parent = blackLayer
    })

    local svCursor = CreateInstance("Frame", {
        Name = "Cursor",
        BackgroundColor3 = Color3.new(1, 1, 1),
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(sat, 0, 1 - val, 0),
        Size = UDim2.new(0, 10, 0, 10),
        ZIndex = 3005,
        Parent = svPicker
    })

    local svCursorStroke = CreateInstance("UIStroke", {
        Thickness = 1.5,
        Color = Color3.new(1, 1, 1),
        Parent = svCursor
    })
    CreateCorner(svCursor, 100)

    local hueSlider = CreateInstance("Frame", {
        Name = "HueSlider",
        Position = UDim2.new(0, 8, 0, 98),
        Size = UDim2.new(1, -16, 0, 8),
        ZIndex = 3001,
        Parent = pickerContainer
    })
    CreateCorner(hueSlider, 100)

    local hueGrad = CreateInstance("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHSV(0, 1, 1)),
            ColorSequenceKeypoint.new(0.167, Color3.fromHSV(0.167, 1, 1)),
            ColorSequenceKeypoint.new(0.333, Color3.fromHSV(0.333, 1, 1)),
            ColorSequenceKeypoint.new(0.5, Color3.fromHSV(0.5, 1, 1)),
            ColorSequenceKeypoint.new(0.667, Color3.fromHSV(0.667, 1, 1)),
            ColorSequenceKeypoint.new(0.833, Color3.fromHSV(0.833, 1, 1)),
            ColorSequenceKeypoint.new(1, Color3.fromHSV(1, 1, 1))
        }),
        Parent = hueSlider
    })

    local hueCursor = CreateInstance("Frame", {
        Name = "HueCursor",
        BackgroundColor3 = Color3.new(1, 1, 1),
        BackgroundTransparency = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(hue, 0, 0.5, 0),
        Size = UDim2.new(0, 10, 0, 10),
        ZIndex = 3005,
        Parent = hueSlider
    })
    CreateCorner(hueCursor, 100)
    CreateInstance("UIStroke", {
        Thickness = 1,
        Color = Color3.fromRGB(20, 20, 20),
        Parent = hueCursor
    })

    local function UpdateColor()
        currentColor = Color3.fromHSV(hue, sat, val)
        colorPreview.BackgroundColor3 = currentColor
        svPicker.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
        svCursor.Position = UDim2.new(sat, 0, 1 - val, 0)
        hueCursor.Position = UDim2.new(hue, 0, 0.5, 0)
        callback(currentColor)
    end

    local svDragging, hueDragging = false, false

    local function ProcessInput(input)
        if not pickerContainer.Visible then return end

        if svDragging then
            local size = svPicker.AbsoluteSize
            local pos = svPicker.AbsolutePosition
            sat = math.clamp((input.Position.X - pos.X) / size.X, 0, 1)
            val = 1 - math.clamp((input.Position.Y - pos.Y) / size.Y, 0, 1)
            UpdateColor()
        elseif hueDragging then
            local size = hueSlider.AbsoluteSize
            local pos = hueSlider.AbsolutePosition
            hue = math.clamp((input.Position.X - pos.X) / size.X, 0, 1)
            UpdateColor()
        end
    end

    svPicker.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            svDragging = true
            ProcessInput(input)
        end
    end)

    hueSlider.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            hueDragging = true
            ProcessInput(input)
        end
    end)

    ui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            ProcessInput(input)
        end
    end)

    ui.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            svDragging = false
            hueDragging = false
        end
    end)

    local function ClosePicker()
        pickerContainer.Visible = false
        expanded = false
        if Library.ActivePicker == ClosePicker then
            Library.ActivePicker = nil
        end
    end

    local function OpenPicker()
        if Library.ActivePicker then
            Library.ActivePicker()
        end
        Library.ActivePicker = ClosePicker

        local btnPos = colorPreview.AbsolutePosition
        local viewport = workspace.CurrentCamera.ViewportSize
        local targetX = btnPos.X - 170
        local targetY = btnPos.Y

        if targetY + 115 > viewport.Y then
            targetY = viewport.Y - 125
        end
        if targetX < 0 then
            targetX = btnPos.X + 50
        end

        pickerContainer.Position = UDim2.new(0, targetX, 0, targetY)
        pickerContainer.Visible = true
        expanded = true
    end

    previewBtn.MouseButton1Click:Connect(function()
        if expanded then
            ClosePicker()
        else
            OpenPicker()
        end
    end)

    local methods = {
        SetColor = function(_, color)
            currentColor = color
            hue, sat, val = color:ToHSV()
            UpdateColor()
        end,
        GetColor = function()
            return currentColor
        end
    }

    if flag and tab._library then
        tab._library:_RegisterConfigElement(flag, "ColorPicker", 
            function() return currentColor end,
            function(value) methods:SetColor(value) end
        )
    end

    return methods
end

function Library._CreateTextBox(tab, config)
    local theme = tab._library.theme
    local name = config.Name or "TextBox"
    local default = config.Default or ""
    local placeholder = config.Placeholder or "Enter text..."
    local callback = config.Callback or function() end
    local clearOnFocus = config.ClearOnFocus or false
    local numbersOnly = config.NumbersOnly or false
    local flag = config.Flag
    local currentText = default

    local frame = CreateInstance("Frame", {
        Name = "TextBox_" .. name,
        BackgroundColor3 = theme.Secondary,
        BackgroundTransparency = 0.4,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, s.TextBox.Height),
        Parent = tab.content
    })
    CreateCorner(frame, 5)
    CreateStroke(frame)

    local nameLabel = CreateInstance("TextLabel", {
        Name = "Name",
        FontFace = f.Regular,
        TextColor3 = theme.Text,
        Text = name,
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0.5, -10),
        TextSize = textsize.Normal,
        Size = UDim2.new(0, 150, 0, 20),
        Parent = frame
    })

    local icon = CreateInstance("ImageLabel", {
        Name = "Icon",
        BackgroundTransparency = 1,
        Image = "rbxassetid://93828793199781",
        ImageColor3 = theme.TextDark,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -165, 0.5, 0),
        Size = UDim2.new(0, 18, 0, 18),
        Parent = frame
    })

    local textBoxContainer = CreateInstance("Frame", {
        Name = "TextBoxContainer",
        BackgroundColor3 = theme.Secondary,
        BackgroundTransparency = 0.04,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -10, 0.5, 0),
        BorderSizePixel = 0,
        Size = UDim2.new(0, s.TextBox.InputWidth, 0, 26),
        Parent = frame
    })
    CreateCorner(textBoxContainer, 5)
    local textBoxStroke = CreateStroke(textBoxContainer)

    local textBox = CreateInstance("TextBox", {
        Name = "Input",
        FontFace = f.Regular,
        TextColor3 = theme.Text,
        PlaceholderText = placeholder,
        PlaceholderColor3 = theme.TextDark,
        Text = currentText,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        BackgroundTransparency = 1,
        TextSize = textsize.Small,
        Size = UDim2.new(1, -16, 1, 0),
        Position = UDim2.new(0, 8, 0, 0),
        ClearTextOnFocus = clearOnFocus,
        Parent = textBoxContainer
    })

    textBox.Focused:Connect(function()
        local activeTheme = tab._library.theme
        CreateTween(textBoxContainer, {BackgroundTransparency = 0}, animationspeed.Fast)
        CreateTween(textBoxStroke, {Color = activeTheme.Accent}, animationspeed.Fast)
        CreateTween(icon, {ImageColor3 = activeTheme.Text}, animationspeed.Fast)
    end)

    textBox.FocusLost:Connect(function(enterPressed)
        local activeTheme = tab._library.theme
        CreateTween(textBoxContainer, {BackgroundTransparency = 0.04}, animationspeed.Fast)
        CreateTween(textBoxStroke, {Color = activeTheme.Border}, animationspeed.Fast)
        CreateTween(icon, {ImageColor3 = activeTheme.TextDark}, animationspeed.Fast)
        
        if numbersOnly then
            local numValue = tonumber(textBox.Text)
            if numValue then
                currentText = tostring(numValue)
                textBox.Text = currentText
            else
                textBox.Text = currentText
            end
        else
            currentText = textBox.Text
        end
        
        callback(currentText, enterPressed)
    end)

    if numbersOnly then
        textBox:GetPropertyChangedSignal("Text"):Connect(function()
            local text = textBox.Text
            local filtered = text:gsub("[^%d%.%-]", "")
            if text ~= filtered then
                textBox.Text = filtered
            end
        end)
    end

    local methods = {
        SetText = function(_, text)
            currentText = tostring(text)
            textBox.Text = currentText
        end,
        GetText = function()
            return currentText
        end,
        SetPlaceholder = function(_, newPlaceholder)
            textBox.PlaceholderText = newPlaceholder
        end,
        Focus = function()
            textBox:CaptureFocus()
        end
    }

    if flag and tab._library then
        tab._library:_RegisterConfigElement(flag, "TextBox", 
            function() return currentText end,
            function(value) methods:SetText(value) end
        )
    end

    return methods
end

function Library._CreateConfigSection(tab)
    local lib = tab._library
    
    Library._CreateContentSection(tab, "Theme Settings")

    local themeDropdown = tab:CreateDropdown({
        Name = "Theme Preset",
        Options = lib:GetThemePresets(),
        Default = lib._currentTheme or "Default",
        Flag = "acrylic_theme",
        Callback = function(selected)
            lib:ApplyThemePreset(selected)
        end
    })
    
    Library._CreateContentSection(tab, "Configuration")

    local configNameBox = Library._CreateTextBox(tab, {
        Name = "Config Name",
        Default = "default",
        Placeholder = "Enter config name...",
        Callback = function(text)
            lib._currentConfig = text
        end
    })

    local configDropdown
    configDropdown = Library._CreateDropdown(tab, {
        Name = "Select Config",
        Options = lib:GetConfigs(),
        Default = "default",
        Callback = function(selected)
            configNameBox:SetText(selected)
            lib._currentConfig = selected
        end
    })

    Library._CreateButton(tab, {
        Name = "Save Config",
        Callback = function()
            local configName = configNameBox:GetText()
            if configName and configName ~= "" then
                lib:SaveConfig(configName)
                configDropdown:Refresh(lib:GetConfigs())
            end
        end
    })

    Library._CreateButton(tab, {
        Name = "Load Config",
        Callback = function()
            local configName = configNameBox:GetText()
            if configName and configName ~= "" then
                lib:LoadConfig(configName)
            end
        end
    })

    Library._CreateButton(tab, {
        Name = "Delete Config",
        Callback = function()
            local configName = configNameBox:GetText()
            if configName and configName ~= "" then
                lib:DeleteConfig(configName)
                configDropdown:Refresh(lib:GetConfigs())
            end
        end
    })

    Library._CreateButton(tab, {
        Name = "Refresh Configs",
        Callback = function()
            configDropdown:Refresh(lib:GetConfigs())
            lib:Notify({
                Title = "Configs Refreshed",
                Description = "Config list updated",
                Duration = 2,
                Icon = "rbxassetid://10723356507"
            })
        end
    })

    Library._CreateToggle(tab, {
        Name = "Auto Save",
        Default = false,
        Callback = function(enabled)
            lib:SetAutoSave(enabled)
        end
    })

    return {
        RefreshConfigs = function()
            configDropdown:Refresh(lib:GetConfigs())
        end
    }
end

--[ ZeroTrace ] --
if not LPH_OBFUSCATED then
	LPH_NO_UPVALUES = function(...)
		return ...
	end
	LPH_NO_VIRTUALIZE = function(...)
		return ...
	end
	LPH_JIT = function(...)
		return ...
	end
end

if not cloneref then
	cloneref = function(...)
		return ...
	end
end

local Collection = cloneref(game:GetService("CollectionService"))
local Run = cloneref(game:GetService("RunService"))
local Players = cloneref(game:GetService("Players"))
local Core = cloneref(game:GetService("CoreGui"))
local Starter = cloneref(game:GetService("StarterGui"))
local Market = cloneref(game:GetService("MarketplaceService"))
local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))
local VirtualInput = cloneref(game:GetService("VirtualInputManager"))
local Player = Players.LocalPlayer
local Terrain = workspace.Terrain

local function Create(class, props)
	local inst = Instance.new(class)
	for k, v in pairs(props) do
		inst[k] = v
	end
	return inst
end

local Env = {
	Modules = {
		Stamina = nil
	},
	Connections = {},
	Threads = {},
	Hooked = {},
	Config = {
		-- Player Reach
		Enabled = false,
		Comp = false,
		Visual = false,
		Color = Color3.fromRGB(255, 255, 255),
		X = 7.5,
		Y = 7.5,
		Z = 7.5,
		Ox = 0,
		Oy = 0,
		Oz = 0,
		Trans = 0.5,
		-- GK Reach
		GKEnabled = false,
		GKVisual = false,
		GKColor = Color3.fromRGB(255, 100, 100),
		GKX = 7.5,
		GKY = 7.5,
		GKZ = 7.5,
		GKOx = 0,
		GKOy = 0,
		GKOz = 0,
		GKTrans = 0.5,
		-- Misc
		AutoPen = false,
		AutoFreekick = false,
		-- Prediction
		PredEnabled = false,
		PredColorMode = "Rainbow",
	},
	State = {
		Base = 100,
		Double = false,
		Infinite = false,
		AutoPenDebounce = false,
		WasFreekickGreen = false,
	},
	Reach = {
		Balls = {},
		Box = nil,
		Folder = nil,
		GKBox = nil,
		GKFolder = nil
	},
	AutoCatch = {
		Enabled = false,
		Distance = 10
	},
	AntiOut = {
		OldFolder = nil,
		OutsFolder = nil
	},
	MobileMovement = {
		Connection = nil
	},
	Misc = {
		AutoPenConnection = nil,
		AutoFreekickConnection = nil,
		PredConnection = nil,
	},
	Pred = {
		MaxTime = 5,
		Step = 1 / 60,
		VisualStep = 1 / 20,
		UpdateRate = 1 / 20,
		MaxBounces = 4,
		Restitution = 0.78,
		Friction = 0.985,
		Drag = 0.008,
		Magnus = 0.00035,
		MinSpeed = 3,
		BeamWidth = 0.16,
		BodyForceDuration = 1.00,
		BallDensity = 10,
		SpinForceMultiplier = 50,
		CurveMultiplier = 1 / 5,
		BackspinBounceReduction = {
			1.45,
			0.75,
			1.45
		},
		MaxVelocityClamp = Vector3.new(140, 125, 140),
		GroundBounceHeight = 10,
		EnableCurve = true,
		EnableBackspin = true,
		MinVelocityThreshold = 5,
		MinPointDistance = 0.3,
		VelocityStabilizeFrames = 6,
		VelocityDeltaThreshold = 8,
		LastUpdate = 0,
		VelocityHistory = {},
	}
}

-- ===================== Helpers =====================

local function tap_key(key, duration)
	VirtualInput:SendKeyEvent(true, key, false, game)
	task.delay(duration or 0.1, function()
		VirtualInput:SendKeyEvent(false, key, false, game)
	end)
end

local function disconnect_connection(conn)
	if conn then
		conn:Disconnect()
	end
end

-- ===================== Anti Out =====================

local function EnableAntiOut()
	for _, o in pairs(workspace.game:GetDescendants()) do
		if o.Name == "out" then
			Env.AntiOut.OldFolder = o.Parent
			Env.AntiOut.OutsFolder = o
			o.Parent = ReplicatedStorage
		end
	end
end

local function DisableAntiOut()
	if Env.AntiOut.OutsFolder then
		Env.AntiOut.OutsFolder.Parent = Env.AntiOut.OldFolder
		Env.AntiOut.OutsFolder = nil
		Env.AntiOut.OldFolder = nil
	end
end

-- ===================== Mobile Movement =====================

local function EnableMobileMovement()
	if Env.MobileMovement.Connection then
		return
	end
	Env.MobileMovement.Connection = Run.RenderStepped:Connect(function()
		local a = game:GetService("StarterPlayer").StarterPlayerScripts:FindFirstChild("ClientEngine")
		local b = Player.PlayerScripts:FindFirstChild("ClientEngine")
		if a then
			a:SetAttribute("moveAcceleration", 10000000)
		end
		if b then
			b:SetAttribute("moveAcceleration", 10000000)
		end
	end)
end

local function DisableMobileMovement()
	if Env.MobileMovement.Connection then
		Env.MobileMovement.Connection:Disconnect()
		Env.MobileMovement.Connection = nil
	end
	local a = game:GetService("StarterPlayer").StarterPlayerScripts:FindFirstChild("ClientEngine")
	local b = Player.PlayerScripts:FindFirstChild("ClientEngine")
	if a then
		a:SetAttribute("moveAcceleration", 10)
	end
	if b then
		b:SetAttribute("moveAcceleration", 10)
	end
end

-- ===================== Misc: Auto Pen =====================

local function get_pen_path_composure()
	local game_folder = workspace:FindFirstChild("game")
	local debug_folder = game_folder and game_folder:FindFirstChild("debug")
	local path_model = debug_folder and debug_folder:FindFirstChild(Player.Name)
	local overlay = path_model and path_model:FindFirstChild("Overlay")
	return overlay and overlay:FindFirstChild("Composure")
end

local function EnableAutoPen()
	disconnect_connection(Env.Misc.AutoPenConnection)
	Env.Misc.AutoPenConnection = nil
	Env.State.AutoPenDebounce = false
	if not Env.Config.AutoPen then
		return
	end
	Env.Misc.AutoPenConnection = Run.RenderStepped:Connect(function()
		local composure = get_pen_path_composure()
		if not composure or not composure:IsA("BasePart") then
			return
		end
		local size = composure.Size
		if size.X < 4 and size.Z < 4 then
			if Env.State.AutoPenDebounce then
				return
			end
			Env.State.AutoPenDebounce = true
			tap_key(Enum.KeyCode.Space, 0.1)
			task.delay(0.2, function()
				Env.State.AutoPenDebounce = false
			end)
		end
	end)
end

-- ===================== Misc: Auto Freekick =====================

local function find_freekick_composure()
	local playerGui = Player:FindFirstChild("PlayerGui")
	local billboardUI = playerGui and playerGui:FindFirstChild("billboardUI")
	if not billboardUI then
		return nil
	end
	for _, d in ipairs(billboardUI:GetDescendants()) do
		if d.Name == "Composure" and d:IsA("Frame") then
			return d
		end
	end
	return nil
end

local function EnableAutoFreekick()
	disconnect_connection(Env.Misc.AutoFreekickConnection)
	Env.Misc.AutoFreekickConnection = nil
	Env.State.WasFreekickGreen = false
	if not Env.Config.AutoFreekick then
		return
	end
	Env.Misc.AutoFreekickConnection = Run.RenderStepped:Connect(function()
		local composure = find_freekick_composure()
		if not composure then
			Env.State.WasFreekickGreen = false
			return
		end
		local is_green = composure.Size.Y.Scale <= 0.15
		if is_green and not Env.State.WasFreekickGreen then
			tap_key(Enum.KeyCode.Space, 0.1)
		end
		Env.State.WasFreekickGreen = is_green
	end)
end

-- ===================== Ball Prediction =====================

local attachmentTemplate = Instance.new("Attachment")

local function clearPredVisuals()
	for _, v in pairs(Terrain:GetChildren()) do
		if v:IsA("Attachment") or v:IsA("Beam") then
			v:Destroy()
		end
	end
end

local function updateVelocityHistory(ball, now)
	local P = Env.Pred
	local history = P.VelocityHistory
	if not history[ball] then
		history[ball] = {
			samples = {},
			lastBigChangeTime = 0,
			stable = false
		}
	end
	local tracker = history[ball]
	local currentVel = ball.AssemblyLinearVelocity
	local currentSpeed = currentVel.Magnitude
	local samples = tracker.samples
	table.insert(samples, {
		vel = currentVel,
		speed = currentSpeed,
		time = now
	})
	while #samples > P.VelocityStabilizeFrames + 2 do
		table.remove(samples, 1)
	end
	if #samples < 2 then
		tracker.stable = false
		return
	end
	local prev = samples[#samples - 1]
	local curr = samples[#samples]
	local delta = (curr.vel - prev.vel).Magnitude / math.max(curr.time - prev.time, 0.001)
	if delta > P.VelocityDeltaThreshold * currentSpeed then
		tracker.lastBigChangeTime = now
		tracker.stable = false
		return
	end
	tracker.stable = (now - tracker.lastBigChangeTime) >= (P.VelocityStabilizeFrames / 60)
end

local function isBallStable(ball)
	local t = Env.Pred.VelocityHistory[ball]
	return t and t.stable
end

local function lerpColor(a, b, t)
	return Color3.new(
		a.R + (b.R - a.R) * t,
		a.G + (b.G - a.G) * t,
		a.B + (b.B - a.B) * t
	)
end

local bouncePalette = {
	Color3.fromRGB(255, 90, 90),
	Color3.fromRGB(255, 170, 70),
	Color3.fromRGB(255, 240, 80),
	Color3.fromRGB(80, 255, 120),
	Color3.fromRGB(80, 180, 255),
	Color3.fromRGB(180, 100, 255),
}

local function getPointColor(point, maxSpeed)
	local mode = Env.Config.PredColorMode
	if mode == "Default" then
		if point.time < 0.30 then
			return Color3.fromRGB(255, 70, 70)
		elseif point.time < 0.385 then
			return Color3.fromRGB(60, 255, 120)
		elseif point.hit then
			return Color3.fromRGB(255, 240, 90)
		else
			return lerpColor(Color3.fromRGB(255, 255, 255), Color3.fromRGB(110, 170, 255),
				math.clamp((point.time - 0.385) / math.max(Env.Pred.MaxTime - 0.385, 0.001), 0, 1))
		end
	elseif mode == "Speed" then
		local t = (maxSpeed > 0) and math.clamp(point.speed / maxSpeed, 0, 1) or 0
		return lerpColor(Color3.fromRGB(70, 170, 255), Color3.fromRGB(255, 70, 70), t)
	elseif mode == "Bounce" then
		return bouncePalette[(point.bounce % #bouncePalette) + 1]
	else
		local t = math.clamp(point.time / Env.Pred.MaxTime, 0, 1)
		return Color3.fromHSV((0.02 + t * 0.78 + point.bounce * 0.08) % 1, 0.9, 1)
	end
end

local function buildSimState(ball)
	local bav = ball:FindFirstChild("BodyAngularVelocity")
	local P = Env.Pred
	local state = {
		mass = math.max(ball:GetMass(), 0.01),
		density = ball.CustomPhysicalProperties and ball.CustomPhysicalProperties.Density or 1,
		bodyForce = ball:FindFirstChild("BodyForce"),
		bodyAngularVelocity = bav,
		vectorForce = ball:FindFirstChildWhichIsA("VectorForce", true),
		linearVelocity = ball:FindFirstChildWhichIsA("LinearVelocity", true),
		direction = "none",
		hasCurve = false,
		hasBackspin = false,
	}
	if bav then
		local angVel = bav.AngularVelocity
		if P.EnableCurve then
			if angVel.Y > 1 then
				state.direction = "left"
				state.hasCurve = true
			elseif angVel.Y < -1 then
				state.direction = "right"
				state.hasCurve = true
			end
		end
		if P.EnableBackspin and (math.abs(angVel.X) > 10 or math.abs(angVel.Z) > 10) then
			state.hasBackspin = true
		end
	end
	return state
end

local function getAcceleration(state, velocity, angularVelocity, tNow)
	local P = Env.Pred
	local accel = Vector3.new(0, -workspace.Gravity, 0)
	if state.bodyForce and tNow <= P.BodyForceDuration then
		accel += (state.bodyForce.Force / state.mass)
	end
	if state.vectorForce and state.vectorForce.Enabled then
		accel += (state.vectorForce.Force / state.mass)
	end
	if state.linearVelocity and state.linearVelocity.Enabled then
		accel += ((state.linearVelocity.VectorVelocity - velocity) * 20)
	end
	if angularVelocity.Magnitude > 0.01 and velocity.Magnitude > 0.01 then
		local magnusEffect = angularVelocity:Cross(velocity) * P.Magnus
		if state.hasCurve then
			local horizontalSpeed = Vector2.new(velocity.X, velocity.Z).Magnitude
			local right = Vector3.new(velocity.Z, 0, -velocity.X)
			if right.Magnitude > 0.001 then
				local curveDir = right.Unit
				local spinForce = P.SpinForceMultiplier * (state.density * P.BallDensity)
				magnusEffect += curveDir * horizontalSpeed * P.CurveMultiplier * spinForce * 0.001
			end
		end
		accel += magnusEffect
	end
	if P.Drag > 0 then
		accel -= velocity * P.Drag
	end
	return accel
end

local function castPath(origin, delta, ignoreList)
	if delta.Magnitude < 0.001 then
		return nil
	end
	local params = RaycastParams.new()
	params.FilterType = Enum.RaycastFilterType.Exclude
	params.IgnoreWater = true
	local localIgnore = table.clone(ignoreList)
	for _ = 1, 8 do
		params.FilterDescendantsInstances = localIgnore
		local result = workspace:Raycast(origin, delta, params)
		if not result then
			return nil
		end
		local name = string.lower(result.Instance.Name)
		if result.Instance == Terrain or
			(result.Instance.CanCollide and (
			name == "grass" or name == "outer" or name == "wall" or
			name == "frame" or name == "collide" or name == "support" or
			name == "support main" or name == "support top" or name == "ropes"
			)) then
			return result
		end
		table.insert(localIgnore, result.Instance)
	end
	return nil
end

local function handleBounce(velocity, normal, state, bounceCount)
	local P = Env.Pred
	local vNormal = normal * velocity:Dot(normal)
	local tangent = velocity - vNormal
	local newTangent = tangent * P.Friction
	local bounceVel = -(vNormal * P.Restitution)
	if state.hasBackspin and bounceCount == 0 then
		local r = P.BackspinBounceReduction
		bounceVel = Vector3.new(bounceVel.X / r[1], bounceVel.Y / r[2], bounceVel.Z / r[3])
		newTangent = Vector3.new(newTangent.X / r[1], newTangent.Y / r[2], newTangent.Z / r[3])
	end
	if bounceVel.Y > P.GroundBounceHeight then
		bounceVel = bounceVel * Vector3.new(1, 0.85, 1)
		newTangent = newTangent * 0.95
	end
	return bounceVel + newTangent
end

local function predictPath(ball)
	local P = Env.Pred
	local vel = ball.AssemblyLinearVelocity
	if vel.Magnitude < P.MinVelocityThreshold then
		return {}
	end
	local state = buildSimState(ball)
	local points = {}
	local currentTime = 0
	local bounceCount = 0
	local nextVisualTime = 0
	local position = ball.Position
	local velocity = Vector3.new(
		math.clamp(vel.X, -P.MaxVelocityClamp.X, P.MaxVelocityClamp.X),
		math.clamp(vel.Y, -P.MaxVelocityClamp.Y, P.MaxVelocityClamp.Y),
		math.clamp(vel.Z, -P.MaxVelocityClamp.Z, P.MaxVelocityClamp.Z)
	)
	local angularVelocity = (state.bodyAngularVelocity and state.bodyAngularVelocity.AngularVelocity)
		or ball.AssemblyAngularVelocity
	local ignore = {
		ball
	}
	local lastAddedPos = position
	table.insert(points, {
		pos = position,
		time = 0,
		speed = velocity.Magnitude,
		bounce = bounceCount,
		hit = false
	})
	while currentTime < P.MaxTime do
		local accel = getAcceleration(state, velocity, angularVelocity, currentTime)
		velocity = velocity + accel * P.Step
		velocity = Vector3.new(
			math.clamp(velocity.X, -P.MaxVelocityClamp.X, P.MaxVelocityClamp.X),
			math.clamp(velocity.Y, -P.MaxVelocityClamp.Y, P.MaxVelocityClamp.Y),
			math.clamp(velocity.Z, -P.MaxVelocityClamp.Z, P.MaxVelocityClamp.Z)
		)
		local delta = velocity * P.Step
		local nextPos = position + delta
		currentTime += P.Step
		local ray = castPath(position, delta, ignore)
		if ray then
			if (ray.Position - lastAddedPos).Magnitude > P.MinPointDistance then
				table.insert(points, {
					pos = ray.Position,
					time = currentTime,
					speed = velocity.Magnitude,
					bounce = bounceCount,
					hit = true,
					normal = ray.Normal
				})
				lastAddedPos = ray.Position
			end
			velocity = handleBounce(velocity, ray.Normal, state, bounceCount)
			position = ray.Position + ray.Normal * 0.06
			bounceCount += 1
			if bounceCount > P.MaxBounces or velocity.Magnitude < P.MinSpeed then
				break
			end
		else
			position = nextPos
			if currentTime >= nextVisualTime and (position - lastAddedPos).Magnitude > P.MinPointDistance then
				table.insert(points, {
					pos = position,
					time = currentTime,
					speed = velocity.Magnitude,
					bounce = bounceCount,
					hit = false
				})
				lastAddedPos = position
				nextVisualTime = currentTime + P.VisualStep
			end
		end
		if position.Y < -25 then
			break
		end
	end
	return points
end

local function createBeam(p0, p1, maxSpeed)
	local att0 = attachmentTemplate:Clone()
	local att1 = attachmentTemplate:Clone()
	att0.WorldPosition = p0.pos
	att1.WorldPosition = p1.pos
	att0.Parent = Terrain
	att1.Parent = Terrain
	local beam = Instance.new("Beam")
	beam.Attachment0 = att0
	beam.Attachment1 = att1
	beam.Width0 = Env.Pred.BeamWidth
	beam.Width1 = Env.Pred.BeamWidth * 0.9
	beam.Color = ColorSequence.new(getPointColor(p0, maxSpeed), getPointColor(p1, maxSpeed))
	beam.FaceCamera = true
	beam.Transparency = NumberSequence.new(0.1)
	beam.Parent = Terrain
end

local function runPredVisualize()
	local P = Env.Pred
	local now = tick()
	if now - P.LastUpdate < P.UpdateRate then
		return
	end
	P.LastUpdate = now
	for _, ball in pairs(Env.Reach.Balls) do
		if ball and ball.Parent and ball:IsA("BasePart") then
			updateVelocityHistory(ball, now)
		end
	end
	clearPredVisuals()
	for _, ball in pairs(Env.Reach.Balls) do
		if not (ball and ball.Parent and ball:IsA("BasePart")) then
			continue
		end
		if not isBallStable(ball) then
			continue
		end
		local points = predictPath(ball)
		if #points < 2 then
			continue
		end
		local maxSpeed = 0
		for _, p in pairs(points) do
			if p.speed > maxSpeed then
				maxSpeed = p.speed
			end
		end
		for i = 1, #points - 1 do
			local p0 = points[i]
			local p1 = points[i + 1]
			if (p1.pos - p0.pos).Magnitude < 0.05 then
				continue
			end
			createBeam(p0, p1, maxSpeed)
		end
	end
end

local function EnablePrediction()
	disconnect_connection(Env.Misc.PredConnection)
	Env.Misc.PredConnection = nil
	clearPredVisuals()
	if not Env.Config.PredEnabled then
		return
	end
	Env.Misc.PredConnection = Run.Heartbeat:Connect(runPredVisualize)
end

-- ===================== Kill =====================

getgenv().zerotrace = {
	Connections = Env.Connections,
	Spoof = {
		Delay = 0,
		Enabled = false
	},
	Kill = function()
		for _, thread in pairs(Env.Threads) do
			task.cancel(thread)
		end
		for closure, _ in pairs(Env.Hooked) do
			pcall(restorefunction(closure))
		end
		for _, conn in pairs(Env.Connections) do
			conn:Disconnect()
		end
		if Env.Reach.Folder then
			Env.Reach.Folder:Destroy()
			Env.Reach.Folder = nil
			Env.Reach.Box = nil
		end
		if Env.Reach.GKFolder then
			Env.Reach.GKFolder:Destroy()
			Env.Reach.GKFolder = nil
			Env.Reach.GKBox = nil
		end
		disconnect_connection(Env.Misc.AutoPenConnection)
		disconnect_connection(Env.Misc.AutoFreekickConnection)
		disconnect_connection(Env.Misc.PredConnection)
		clearPredVisuals()
		DisableMobileMovement()
		DisableAntiOut()
		if Window then
			Window:Destroy()
		end
		getgenv().zerotrace = nil
	end
}

-- ===================== Update Check =====================

local info = Market:GetProductInfo(game.PlaceId)
if info and info.Updated ~= "" then
	local bind = Instance.new("BindableFunction")
	local passed = nil
	bind.OnInvoke = function(opt)
		passed = (opt == "Yes")
	end
	Starter:SetCore("SendNotification", {
		Title = "ZeroTrace",
		Text = "Game updated. It's recommended to check with a developer before continuing to avoid detection or a possible ban. Continue?",
		Duration = 60,
		Callback = bind,
		Button1 = "Yes",
		Button2 = "No"
	})
	repeat
		task.wait()
	until passed ~= nil
	if not passed then
		getgenv().zerotrace.Kill()
		return
	end
end

for _, v in pairs(getgc(true)) do
	if type(v) == "table" then
		if rawget(v, "gkCheck") then
			setrawmetatable(v, { __index = function() end })
			for _, f in pairs({v.react, v.gkReact, v.catch}) do
				if type(f) == "function" then
					for idx, val in pairs(debug.getconstants(f)) do
						if val == "ignoreReactDecline" or val == "specialTool" or val == "exemptShielding" or val == "fromReflex" or val == "bypassChecks" then
							debug.setconstant(f, idx, "ball")
						end
						if type(val) == "number" then
							if val == 3.25 or val == 8 or val == 4.05 or val == 3.2 then debug.setconstant(f, idx, 9999) end
						end
					end
				end
			end
		end
		if rawget(v, "start") and rawget(v, "heal") and rawget(v, "maxStamina") then Env.Modules.Stamina = v end
	elseif type(v) == "function" then
		if getinfo(v).name == "SetCallback" then
			for _, tbl in pairs(getupvalues(v)) do
				if type(tbl) == "table" and tbl["Ping"] then
					local old = tbl["Ping"]
					tbl["Ping"] = LPH_JIT(function(...)
						local args = {...}
						if getgenv().zerotrace and getgenv().zerotrace.Spoof.Enabled and getgenv().zerotrace.Spoof.Delay > 0 then task.wait(getgenv().zerotrace.Spoof.Delay / 1000) end
						return old(table.unpack(args))
					end)
					Env.Hooked[old] = clonefunction(old)
					break
				end
			end
		end
	end
end


-- ===================== Stamina =====================

local function ApplyStamina()
	local module = Env.Modules.Stamina
	if not module then return end

	if Env.State.Infinite then
		module.maxStamina = 999999
	elseif Env.State.Double then
		module.maxStamina = 200
	else
		module.maxStamina = Env.State.Base
	end

	if module.stamina then
		module.stamina.Value = module.maxStamina
	end
end

local function UpdateStaminaUI()
	local mode = "default"

	if Env.State.Infinite then
		mode = "inf"
	elseif Env.State.Double then
		mode = "2x"
	end

	local ui = Player.PlayerGui:FindFirstChild("UI")
	local frame = ui and ui:FindFirstChild("Stamina")

	if frame and frame:FindFirstChild("Infinite") and frame:FindFirstChild("Endurance") then
		if mode == "inf" then
			frame.BackgroundColor3 = Color3.fromRGB(62, 174, 226)
			frame.Infinite.Visible = true
			frame.Endurance.Visible = false

		elseif mode == "2x" then
			frame.BackgroundColor3 = Color3.fromRGB(104, 145, 156)
			frame.Endurance.Visible = true
			frame.Infinite.Visible = false

		else
			frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			frame.Endurance.Visible = false
			frame.Infinite.Visible = false
		end
	end
end


-- On respawn → ONLY update UI
table.insert(Env.Connections, Player.CharacterAdded:Connect(function()
	task.wait(1)
	UpdateStaminaUI()
end))

table.insert(Env.Connections, Collection:GetInstanceAddedSignal("Ball"):Connect(function(ball)
	if ball:IsA("BasePart") and not table.find(Env.Reach.Balls, ball) then
		table.insert(Env.Reach.Balls, ball)
	end
end))

table.insert(Env.Connections, Collection:GetInstanceRemovedSignal("Ball"):Connect(function(ball)
	local idx = table.find(Env.Reach.Balls, ball)
	if idx then
		table.remove(Env.Reach.Balls, idx)
		Env.Pred.VelocityHistory[ball] = nil
	end
end))

for _, ball in pairs(Collection:GetTagged("Ball")) do
	if ball:IsA("BasePart") and not table.find(Env.Reach.Balls, ball) then
		table.insert(Env.Reach.Balls, ball)
	end
end

-- ===================== Reach Helpers =====================

local function FireTouchLimbs(char, target, limbs)
	for _, limb in pairs(limbs) do
		local part = char:FindFirstChild(limb)
		if part and part:IsA("BasePart") then
			firetouchinterest(part, target, 0)
			firetouchinterest(part, target, 1)
		end
	end
end

local function GetTarget(bounds, root, comp)
	if comp then
		for _, ball in pairs(bounds) do
			local owner = false
			owner = isnetworkowner(ball)
			if not owner then
				owner = ball:GetAttribute("networkOwner") == Player.UserId
			end
			if not owner then
				return ball
			end
		end
		return nil
	else
		return bounds[1]
	end
end

local function BallNotOwned(ball)
	local owner = false
	owner = isnetworkowner(ball)
	if not owner then
		owner = ball:GetAttribute("networkOwner") == Player.UserId
	end
	return not owner
end

local function HasGKTool()
	local char = Player.Character
	if not char then
		return false
	end
	for _, item in pairs(char:GetChildren()) do
		if item:IsA("Tool") and item.Name == "GK" then
			return true
		end
	end
	return false
end

local function DestroyVisual(folderKey, boxKey)
	if Env.Reach[folderKey] then
		Env.Reach[folderKey]:Destroy()
		Env.Reach[folderKey] = nil
		Env.Reach[boxKey] = nil
	end
end

local function UpdateVisual(root, cfg, xKey, yKey, zKey, oxKey, oyKey, ozKey, transKey, colorKey, folderKey, boxKey)
	local box = Env.Reach[boxKey]
	if box then
		box.Adornee = root
		box.Size = Vector3.new(cfg[xKey], cfg[yKey], cfg[zKey])
		box.Transparency = cfg[transKey]
		box.Color3 = cfg[colorKey]
		box.CFrame = CFrame.new(cfg[oxKey], cfg[oyKey], cfg[ozKey])
	else
		local folder = Create("Folder", {
			Parent = Core
		})
		if not folder then
			return
		end
		local newBox = Create("BoxHandleAdornment", {
			Parent = folder,
			ZIndex = 10,
			AlwaysOnTop = true,
			Visible = true,
			Transparency = cfg[transKey],
			Adornee = root,
			Color3 = cfg[colorKey],
			Size = Vector3.new(cfg[xKey], cfg[yKey], cfg[zKey]),
			CFrame = CFrame.new(cfg[oxKey], cfg[oyKey], cfg[ozKey])
		})
		Env.Reach[folderKey] = folder
		Env.Reach[boxKey] = newBox
	end
end

-- ===================== RenderStepped =====================

table.insert(Env.Connections, Run.RenderStepped:Connect(LPH_JIT(function()
	local char = Player.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	if not root then
		DestroyVisual("Folder", "Box")
		DestroyVisual("GKFolder", "GKBox")
		return
	end

	-- Player Reach Visual
	if Env.Config.Visual then
		UpdateVisual(root, Env.Config, "X", "Y", "Z", "Ox", "Oy", "Oz", "Trans", "Color", "Folder", "Box")
	else
		DestroyVisual("Folder", "Box")
	end

	-- GK Reach Visual
	if Env.Config.GKVisual then
		UpdateVisual(root, Env.Config, "GKX", "GKY", "GKZ", "GKOx", "GKOy", "GKOz", "GKTrans", "GKColor", "GKFolder", "GKBox")
	else
		DestroyVisual("GKFolder", "GKBox")
	end
	
	local valid = {}
	for _, ball in pairs(Env.Reach.Balls) do
		if ball and ball.Parent then
			table.insert(valid, ball)
		end
	end

	-- Auto Catch
	if Env.AutoCatch.Enabled then
		if HasGKTool() then
			for _, ball in ipairs(valid) do
				if BallNotOwned(ball) then
					if (ball.Position - root.Position).Magnitude < (Env.AutoCatch.Distance or 10) then
						VirtualInput:SendKeyEvent(true, Enum.KeyCode.F, false, game)
						VirtualInput:SendKeyEvent(false, Enum.KeyCode.F, false, game)
						break
					end
				end
			end
		end
	end
	
	if #valid == 0 then
		return
	end
	
	local overlap = OverlapParams.new()
	overlap.FilterType = Enum.RaycastFilterType.Include
	overlap.FilterDescendantsInstances = valid

	-- Player Reach
	if Env.Config.Enabled then
		local bounds = workspace:GetPartBoundsInBox(
			root.CFrame * CFrame.new(Env.Config.Ox, Env.Config.Oy, Env.Config.Oz),
			Vector3.new(Env.Config.X, Env.Config.Y, Env.Config.Z),
			overlap
		)
		if #bounds > 0 then
			table.sort(bounds, function(a, b)
				return (a.Position - root.Position).Magnitude < (b.Position - root.Position).Magnitude
			end)
			local target = GetTarget(bounds, root, Env.Config.Comp)
			if target and type(firetouchinterest) == "function" then
				FireTouchLimbs(char, target, {
					"Collide",
					"Torso",
					"Head"
				})
			end
		end
	end

	-- GK Reach
	if Env.Config.GKEnabled then
		local gkBounds = workspace:GetPartBoundsInBox(
			root.CFrame * CFrame.new(Env.Config.GKOx, Env.Config.GKOy, Env.Config.GKOz),
			Vector3.new(Env.Config.GKX, Env.Config.GKY, Env.Config.GKZ),
			overlap
		)
		if #gkBounds > 0 then
			table.sort(gkBounds, function(a, b)
				return (a.Position - root.Position).Magnitude < (b.Position - root.Position).Magnitude
			end)
			local target = gkBounds[1]
			if target and type(firetouchinterest) == "function" then
				FireTouchLimbs(char, target, {
					"LeftHand",
					"RightHand"
				})
			end
		end
	end
end)))

-- ===================== UI =====================

Window = Library.new("ZeroTrace #I❤️Juice", "ZeroTrace #I❤️Juice")
Window:SetToggleKey(Enum.KeyCode.RightControl)

local Main = Window:CreateSection("Main")
local ReachTab = Main:CreateTab("Reach", "house")
local CharacterTab = Main:CreateTab("Character", "user")
local MiscTab = Main:CreateTab("Misc", "star")
local SettingTab = Main:CreateTab("Settings", "settings")

-- ===================== Reach Tab =====================

ReachTab:CreateSection("Player Reach")
ReachTab:CreateToggle({
	Name = "Reach",
	Flag = "Player_Reach_Enabled",
	Default = false,
	Callback = function(val)
		Env.Config.Enabled = val
	end
})
ReachTab:CreateToggle({
	Name = "Comp",
	Flag = "Player_Reach_Comp",
	Default = false,
	Callback = function(val)
		Env.Config.Comp = val
	end
})
ReachTab:CreateSlider({
	Name = "X",
	Flag = "Player_Reach_X",
	Min = 0,
	Max = 7.5,
	Default = 7.5,
	Callback = function(val)
		Env.Config.X = val
	end
})
ReachTab:CreateSlider({
	Name = "Y",
	Flag = "Player_Reach_Y",
	Min = 0,
	Max = 7.5,
	Default = 7.5,
	Callback = function(val)
		Env.Config.Y = val
	end
})
ReachTab:CreateSlider({
	Name = "Z",
	Flag = "Player_Reach_Z",
	Min = 0,
	Max = 7.5,
	Default = 7.5,
	Callback = function(val)
		Env.Config.Z = val
	end
})
ReachTab:CreateSlider({
	Name = "OffsetX",
	Flag = "Player_Reach_OffsetX",
	Min = -15,
	Max = 15,
	Default = 0,
	Callback = function(val)
		Env.Config.Ox = val
	end
})
ReachTab:CreateSlider({
	Name = "OffsetY",
	Flag = "Player_Reach_OffsetY",
	Min = -15,
	Max = 15,
	Default = 0,
	Callback = function(val)
		Env.Config.Oy = val
	end
})
ReachTab:CreateSlider({
	Name = "OffsetZ",
	Flag = "Player_Reach_OffsetZ",
	Min = -15,
	Max = 15,
	Default = 0,
	Callback = function(val)
		Env.Config.Oz = val
	end
})
ReachTab:CreateToggle({
	Name = "Visualizer",
	Flag = "Player_Reach_Visualizer",
	Default = false,
	Callback = function(val)
		Env.Config.Visual = val
	end
})
ReachTab:CreateColorPicker({
	Name = "Color",
	Flag = "Player_Reach_Color",
	Default = Color3.fromRGB(255, 255, 255),
	Callback = function(color)
		Env.Config.Color = color
	end
})

ReachTab:CreateSection("GK Reach")
ReachTab:CreateToggle({
	Name = "Reach",
	Flag = "GK_Reach_Enabled",
	Default = false,
	Callback = function(val)
		Env.Config.GKEnabled = val
	end
})
ReachTab:CreateSlider({
	Name = "X",
	Flag = "GK_Reach_X",
	Min = 0,
	Max = 7.5,
	Default = 7.5,
	Callback = function(val)
		Env.Config.GKX = val
	end
})
ReachTab:CreateSlider({
	Name = "Y",
	Flag = "GK_Reach_Y",
	Min = 0,
	Max = 7.5,
	Default = 7.5,
	Callback = function(val)
		Env.Config.GKY = val
	end
})
ReachTab:CreateSlider({
	Name = "Z",
	Flag = "GK_Reach_Z",
	Min = 0,
	Max = 7.5,
	Default = 7.5,
	Callback = function(val)
		Env.Config.GKZ = val
	end
})
ReachTab:CreateSlider({
	Name = "OffsetX",
	Flag = "GK_Reach_OffsetX",
	Min = -15,
	Max = 15,
	Default = 0,
	Callback = function(val)
		Env.Config.GKOx = val
	end
})
ReachTab:CreateSlider({
	Name = "OffsetY",
	Flag = "GK_Reach_OffsetY",
	Min = -15,
	Max = 15,
	Default = 0,
	Callback = function(val)
		Env.Config.GKOy = val
	end
})
ReachTab:CreateSlider({
	Name = "OffsetZ",
	Flag = "GK_Reach_OffsetZ",
	Min = -15,
	Max = 15,
	Default = 0,
	Callback = function(val)
		Env.Config.GKOz = val
	end
})
ReachTab:CreateToggle({
	Name = "Visualizer",
	Flag = "GK_Reach_Visualizer",
	Default = false,
	Callback = function(val)
		Env.Config.GKVisual = val
	end
})
ReachTab:CreateColorPicker({
	Name = "Color",
	Flag = "GK_Reach_Color",
	Default = Color3.fromRGB(255, 100, 100),
	Callback = function(color)
		Env.Config.GKColor = color
	end
})
local originalMaxStamina = Env.Modules.Stamina.maxStamina

local old; old = hookfunction(Env.Modules.Stamina.start, function(self, amount)
	old(self, amount)
	
	-- Apply bypass for infinite
	if Env.State.Infinite and self.stamina then
		self.stamina.Value = self.maxStamina
	end
end)

local function UpdateStaminaUI()
	local mode = "default"
	if Env.State.Infinite then
		mode = "inf"
	end

	local ui = Player.PlayerGui:FindFirstChild("UI")
	local frame = ui and ui:FindFirstChild("Stamina")

	if frame and frame:FindFirstChild("Infinite") and frame:FindFirstChild("Endurance") then
		if mode == "inf" then
			frame.BackgroundColor3 = Color3.fromRGB(62, 174, 226)
			frame.Infinite.Visible = true
			frame.Endurance.Visible = false
		else
			frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			frame.Endurance.Visible = false
			frame.Infinite.Visible = false
		end
	end
end

local function UpdateStamina()
	Env.Modules.Stamina.maxStamina = originalMaxStamina
	
	if Env.Modules.Stamina.stamina then
		Env.Modules.Stamina.stamina.Value = Env.Modules.Stamina.maxStamina
	end
	
	UpdateStaminaUI()
end

-- ===================== Character Tab =====================
CharacterTab:CreateSection("Stamina")

CharacterTab:CreateToggle({
	Name = "Infinite Stamina",
	Flag = "Char_InfStamina",
	Default = false,
	Callback = function(val)
		Env.State.Infinite = val
		UpdateStamina()
	end
})


CharacterTab:CreateSection("GK")
CharacterTab:CreateToggle({
	Name = "Auto Catch",
	Flag = "GK_AutoCatch",
	Default = false,
	Callback = function(val)
		Env.AutoCatch.Enabled = val
	end
})
CharacterTab:CreateSlider({
	Name = "Auto Catch Distance",
	Flag = "GK_AutoCatchDist",
	Min = 1,
	Max = 26,
	Default = 10,
	Callback = function(val)
		Env.AutoCatch.Distance = val
	end
})

CharacterTab:CreateSection("Movement")
CharacterTab:CreateToggle({
	Name = "Mobile Movement",
	Flag = "Char_MobileMovement",
	Default = false,
	Callback = function(val)
		if val then
			EnableMobileMovement()
		else
			DisableMobileMovement()
		end
	end
})

CharacterTab:CreateSection("No Cooldown")

local processed = {}
table.insert(Env.Threads, task.spawn(LPH_NO_VIRTUALIZE(function()
	while task.wait(5) do
		for _, v in pairs(getgc(true)) do
			if type(v) == "table" and rawget(v, "inputBegan") and rawget(v, "react") then
				local s = getfenv(v.inputBegan).script
				if typeof(s) == "Instance" and s.GetFullName
					and not s:GetFullName():find("mechanics.gk")
					and not s:GetFullName():find("mechanics.kick")
					and not s:GetFullName():find("mechanics.pass") then
					if not processed[s.Name] then
						processed[s.Name] = true
						local data = {
							name = s.Name,
							tbl = v,
							ended = rawget(v, "inputEnded") ~= nil,
							oldbegan = rawget(v, "inputBegan"),
							oldended = rawget(v, "inputEnded"),
							enabled = false
						}
						if data.ended then
							rawset(data.tbl, "inputBegan", function(self, ...)
								local args = {
									...
								}
								if data.enabled then
									self.using = false
								end
								return data.oldbegan(self, table.unpack(args))
							end)
							rawset(data.tbl, "inputEnded", function(self, ...)
								local args = {
									...
								}
								if data.enabled then
									self.using = true
									task.spawn(data.oldended, self, table.unpack(args))
									self.using = false
									return
								end
								return data.oldended(self, table.unpack(args))
							end)
						else
							rawset(data.tbl, "inputBegan", function(self, ...)
								local args = {
									...
								}
								if data.enabled then
									self.using = false
									task.spawn(data.oldbegan, self, table.unpack(args))
									self.using = false
									return
								end
								return data.oldbegan(self, table.unpack(args))
							end)
						end
						CharacterTab:CreateToggle({
							Name = "No " .. data.name:gsub("(%a)([%w']*)", function(a, b)
								return a:upper() .. b
							end) .. " Cooldown",
							Flag = "NoCooldown_" .. data.name,
							Default = false,
							Callback = function(val)
								data.enabled = val
							end
						})
					end
				end
			end
		end
	end
end)))

-- ===================== Misc Tab =====================
MiscTab:CreateSection("Automation")
MiscTab:CreateToggle({
	Name = "Perfect Penalty Timing",
	Flag = "Misc_AutoPen",
	Default = false,
	Callback = function(val)
		Env.Config.AutoPen = val
		EnableAutoPen()
	end
})
MiscTab:CreateToggle({
	Name = "Perfect Freekick Timing",
	Flag = "Misc_AutoFreekick",
	Default = false,
	Callback = function(val)
		Env.Config.AutoFreekick = val
		EnableAutoFreekick()
	end
})


MiscTab:CreateSection("Ball Prediction")
MiscTab:CreateToggle({
	Name = "Enable Prediction",
	Flag = "Misc_BallPred",
	Default = false,
	Callback = function(val)
		Env.Config.PredEnabled = val
		EnablePrediction()
	end
})
MiscTab:CreateDropdown({
	Name = "Color Mode",
	Flag = "Misc_PredColorMode",
	Options = {
		"Rainbow",
		"Default",
	},
	Default = "Default",
	Callback = function(val)
		Env.Config.PredColorMode = val
	end
})

SettingTab:CreateSection("UI Settings")
SettingTab:CreateKeybind({
	Name = "Menu Toggle Key",
	Flag = "UI_MenuToggleKey",
	Default = Enum.KeyCode.RightControl,
	Callback = function(key)
		Window:SetToggleKey(key)
	end
})

SettingTab:CreateSection("Network")
SettingTab:CreateToggle({
	Name = "Ping Spoof",
	Flag = "Net_PingSpoof",
	Default = false,
	Callback = function(val)
		if getgenv().zerotrace then
			getgenv().zerotrace.Spoof.Enabled = val
		end
	end
})
SettingTab:CreateSlider({
	Name = "Delay (ms)",
	Flag = "Net_PingSpoofDelay",
	Min = 0,
	Max = 200,
	Default = 0,
	Callback = function(val)
		if getgenv().zerotrace then
			getgenv().zerotrace.Spoof.Delay = val
		end
	end
})

SettingTab:CreateSection("AFK")
SettingTab:CreateToggle({
	Name = "Anti Idle",
	Flag = "AFK_AntiIdle",
	Default = false,
	Callback = function(val)
		for _, conn in pairs(getconnections(Player.Idled)) do
			if val then
				conn:Disable()
			else
				conn:Enable()
			end
		end
	end
})

SettingTab:CreateSection("Script")
SettingTab:CreateButton({
	Name = "Kill Script",
	Callback = function()
		if getgenv().zerotrace then
			getgenv().zerotrace.Kill()
		end
	end
})

SettingTab:CreateConfigSection()

Window:Notify({
	Title = "Loaded",
	Description = "ZeroTrace Fully Loaded.",
	Duration = 3
})
