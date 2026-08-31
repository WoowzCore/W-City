
local allowedchars = {
	"ах",
	"АХ",
	"гхх",
	"ГХ",
	"АХХХ",
}

local audible_pain = {
	"ААААГХ... БЛЯЯЯТЬ... КАК ЖЕ БОЛЬНО!",
	"Я ЭТОГО НЕ ВЫНЕСУ!!!",
    "ОСТАНОВИТЕ ЭТО ПРОШУ ВАС!!!",
    "ПОЧЕМУ ЭТО НЕ ОСТАНАВЛИВАЕТСЯ",
    "ДОБЕЙТЕ МЕНЯ!",
    "Зачем я родился...",
    "Я бы отдал всё что-бы это остановить...",
    "Это не жизнь, это ПЫТКА",
    "Меня ничего не ебёт, остановите это прошу",
    "Ничего не имеет значения, КРОМЕ ТОГО, ЧТО-БЫ ЭТО ОСТАНОВИТЬ...",
    "Каждая секунда длится вечность!",
    "СМЕРТЬ БЫЛА БЫ МИЛОСЕРДИЕМ...",
    "Хотя бы один миг бы без боли...",
	"МНЕ БЫ СЕЙЧАС ОБЕЗБОЛИВАЮЩЕЕ",
    "СУКА ЭТО ПИЗДЕЦ БЛЯТЬ",
    "ПИЗДЕЦ КАК БОЛЬНО!!!",
    "ЖЖЁТСЯ!!!!!!"
}

local sharp_pain = {
    "ААААХ",
    "ААААХ",
    "ААааАХ",
    "ААааАХ",
    "ААааАААГХ",
    "ААааАХ",
    "ААaАааХ",
    "АААААaаХ",
    "ААааАХХХХ",
    "ААaАА",
    "АААААa",
    "ААААaАААаааагхх",
    "АААааАа",
    "АааААагхф",
    "ааАааАафф",
    "аааххх",
    "АААааГХХХ",
    "АААааААХХ",
    "АААааААААаГХХХХ",
    "АААааААААаГХААААХХХ",
    "АААааААААаГХХААААААХХ",
    "АААааААААаГХХХХ",
    "АААааАААааАААаГХХХХ",
    "АААааАААааАААаААААААГХХХХ",
    "АААааААААаГХХХХ",
    "АААааААААААААХХХ",
    "АААааААААаГХАаааХХ",
    "АААааААААаАаааааААААХХ",
    "АААааААААаАААААААГГГГГГАГХХХХ",
    "АААааАААааАААаАААААААААААААААХ",
    "БЛЯЯЯЯЯЯЯЯЯЯТЬ",
    "БЛЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯТЬ",
    "ББЛЯЯЯЯЯЯЯТЬ",
    "СУКААААААААААААААА",
    "СУУУУУУКАААААААА",
    "СУКККККААААААААААААААА",
    "ТВООООЮ МААААААТЬ"
}

hg.sharp_pain = sharp_pain

local random_phrase = {
	"Что-то прохладно здесь...",
	"Это место тихое",
	"Жить это весело",
	"А что если, эта тишина никогда не закончится?",
	"Почему ничего не происходит?",
	"Я слышу своё сердцебиение...",
	"Время ощущается... как-то иначе",
	"Тишина почти оглушает",
	"Здесь есть кто нибудь?",
	"Как долго мне ещё стоять?",
	"Воздух кажется затхлым",
	"Я не помню как попал сюда",
	"Ничего не меняется",
	"Я во сне?",
	"Тени сегодня темнее чем обычно",
	"Мои мысли так громки в этой тишине",
	"Когда успело потемнеть?",
	"Мне кажется за мною кто-то наблюдает...",
	"Это уже всё происходило",
	"Кто нибудь знает что я здесь?",
	"Стены сближаются...",
	"О чём я сейчас думаю?",
	"Время замедлилось...",
	"Я не помню вчерашний день...",
	"Оно мне надо?",
    "Пора заканчивать",
    "Мне нужна свобода",
    "Пора действовать..."
}


local fear_hurt_ironic = {
	"Наверное это и будет урок... если я выживу",
	"Мои внуки не поверят в эту часть моей истории",
	"Это тупой способ умереть",
    "Мне дадут премию Дарвина",
	"По крайне мере, жизнь была не скучной",
	"На заметку, так больше не делать",
	"Это отвратный день для смерти",
	"Всё будет нормально...",
	"По крайне мере я умру, зная что я был прав во всём",
	"Наверное, я получил по заслугам",
	"Я сам напросился...",
	"На моих похоронах, явно посмеются над этим",
	"Хорошая история получится...",
	"Я выживал и в более ужасных ситуациях",
}

local fear_phrases = {
	"Не так уж и страшно...",
	"Я не хочу умирать вот так!",
	"Неужели это действительно конец?",
	"Это плохо...",
	"Это реально конец?",
	"Я не хочу умирать так...",
	"Хотел бы я найти выход...",
	"Я так о многом сожалею",
	"Я не верю...",
	"Я не верю что это происходит со мною",
    "Это необратимо...",
	"Это уже не шутки",
	"Я не выживу",
	"Это намного хуже, чем я предполагал",
	"Это так несправедливо",
	"Я не могу сдаться",
	"Надо было подумать дважды",
	"Мне следовало прислушаться к инстинктам",
	"Дыши",
	"Руки замёрзли",
    "Это конец...",
    "Пиздец...",
    "Ну всё...",
    "Свет в конце туннеля"
}

local is_aimed_at_phrases = {
    "О Боже, вот он конец",
    "Не двигаться",
    "Неужели я действительно так умру?",
    "Надо было бежать, почему я не побежал?",
    "Пожалуйста, не нажимай курок!",
    "Я вижу его палец на спусковом крючке",
    "Я не хочу умирать, особенно вот так!",
    "Я сделаю что угодно, не убивай!",
    "Если я начну умолять, станет только хуже?",
    "Это не реально",
    "Кто нибудь, СПАСИТЕ!",
    "Я не хочу умирать здесь!",
    "Я не умру в туалете!",
    "Моей последней эмоцией, будет страх...",
    "Я не умру!",
    "Я буду сниться у тебя в кошмарах"
}

local near_death_poetic = {
	"Я пытаюсь встать... но просто не могу...",
	"Дыхание замедляется...",
	"Я не знаю... открыты ли мои глаза...",
	"Затупляется вкус металлической крови...",
	"Взгляд размывается...",
	"Что вообще происходит?",
	"Сильное эхо в моей голове",
	"Моргать становиться всё тяжелее, и тяжелее...",
	"Пальцы будто током бьёт...",
	"Мне жжёт грудь...",
	"Теперь всё бессмысленно",
    "Это финал",
    "Моё тело становится легче",
    "Не могу пошевелиться",
    "Я парализован",
    "Я... чувствую... спокойствие..."
}

local near_death_positive = {
	"Я не умру!",
	"Я должен выжить",
    "Я буду бороться!",
	"У меня есть ещё шанс",
	"Страх меня не одолеет",
	"Ещё одна попытка",
	"Я отказываюсь умирать здесь",
	"Так... нужно подумать",
	"Лучше не двигаться, а то будет хуже",
	"Нужно расслабиться",
    "Нужно успокоиться",
	"Всё не кончено",
	"Игнорируй боль",
    "От боли ещё не умирали",
	"Если это конец, по крайне мере это будет быстро",
	"Я переживал и похуже",
	"Я представлял это иначе",
    "Слишком легко"
}

local broken_limb = {
	"СУКА, Я РЕАЛЬНО СЛОМАЛ КОНЕЧНОСТЬ!",
	"Я ЧУВСТВУЮ КАК ОСКОЛКИ КОСТИ ВПИВАЮТСЯ МНЕ В МЯСО!",
	"БЛЯТЬ РЕАЛЬНО СЛОМАНО, я так думаю...",
	"Лучше не думать об этом...",
	"Оно не должно так поворачиваться",
	"Ох блять, я свернул конечность",
	"Я не вижу внешнего разрыва, скорее всего внутри",
    "Моя конечность!",
    "Сука, больно же блять",
    "Что-то явно не так!",
    "Мне срочно нужна помощь!",
    "Это не нормально!",
    "ВЕРНИТЕ КАК БЫЛО!"
}

local dislocated_limb = {
	"Я однозначно себе вывернул это",
	"Мне нужно вправить кость обратно",
	"Я не чувствую её",
	"Может я и не вывернул себе ничего?",
	"Моя конечность вывихнута",
}

local hungry_a_bit = {
    "Еды бы...",
    "Еда бы не помешала",
    "Я голоден...",
    "Мне нужно перекусить",
    "Съесть бы чего нибудь",
    "Где бы еды взять",
    "Еда...",
    "Я бы танк съел"
}

local very_hungry = {
    "Мне очень нужна еда!",
    "Хоть немного бы еды...",
    "Я чувствую себя хуёво... мне нужна еда!!!",
    "Живот болит от голода уже",
    "Я сейчас съем кого нибудь",
    "Живот урчит уже не по детски",
    "ДАЙТЕ МНЕ ЕДЫ!",
    "Я ХОЧУ ЖРАТЬ!",
    "Меня уже тошнит от голода"
}

local after_unconscious = {
    "Что случилось? Почему всё болит...",
	"Где я? что произошло?",
	"Я-я думал я тут умру",
	"Голова трещит...",
    "Голова кружится...",
	"Я чуть не умер секунду назад?",
    "Я думал это конец",
    "Что только что было?",
	"Я был без сознания?",
    "Я был в коме?",
	"Небеса не забрали меня?",
	"Охх... блять... голова раскалывается...",
	"Нужно вставать... через силу...",
	"Где я блять вообще? что за место?",
	"Я больше не окажусь в такой ситуации!",
    "Сука, это был пиздец",
    "Нужно вставать",
    "Я сейчас опять потеряю сознание"
}

local slight_braindamage_phraselist = {
	"Я не пойму",
	"Это не имеет смысла",
	"Где я?",
	"Что это?",
	"Что произошло?",
	"Алё?",
    "Ау?",
	"Ээээмммм",
	"Что?",
    "Кто я?",
    "Привет",
    "Как дела? Или не...",
    "Может быть так?",
    "Оно тут должно быть?",
    "У меня глаза плывут",
    "Это галлюцинации?",
    "Лоботамизация",
    "Лебоборбара",
    "Маркавко",
    "Диркпикси",
    "Марево",
    "Лаваново",
    "Керпертово",
    "Что я сказал?",
    "Я немой?",
    "Я рыба",
    "Я овощь?",
    "Даун",
    "Ай... как больно",
    "Голова кружится",
    "Не уж то ли",
    "Ты тут давно?",
    "Я тут давно?",
    "Мы все тут давно?",
    "Я просто игрок Garry's Mod...",
    "Я псих ебанный",
    "Неучи"
}

local braindamage_phraselist = {
	"Хахахввахах вхаха... хавалка?!",
	"Бреб-реребебебе...",
	"Ммммм... угуууу...",
	"Револо.... леле...",
	"Грабо??? до? до?",
	"Дама... ле...",
	"Брдыщ... щииии?",
	"Хурма... Щавель...",
	"Помооо... гиии... тле?",
	"Бомбооомм.... бомбааа!!!",
	"Брухозавврик...",
    "Ахахахахахахаха...",
    "Леввв...",
    "Ди...",
    "Мрак...",
    "Деби...",
    "Фиифии...",
    "Хроп...",
    "Шшшшшш....",
    "Фатаватафа..."
}

local cold_phraselist = {
	"Становиться очень холодно",
	"Слишком холодно для меня",
	"Меня трясёт!",
	"Экстремальный холод...",
	"Я так гипертермию получу...",
	"Здесь достаточно холодно",
	"Я чувствую я заболею",
    "Холодрыга...",
    "Тут -30C?"
}

local freezing_phraselist = {
	"Я... я... не чувству... своё тело...",
	"Мои... ноги...",
	"Еб... банный... холод...",
	"Я... ничего... не чувствую...",
	"Холод...",
	"Мои пальцы... почернеют...",
}

local numb_phraselist = {
	"Б-Больше не холодно...",
	"Откуда... откуда жара?",
	"Это гипертермия?...",
	"Наконец-то... тепло...",
	"Местами... тепло...",
    "Всё будет хорошо?...",
	"Было только что холодно... откуда тепло?",
    "Потеплело?...",
    "Это не нормально..."
}

local hot_phraselist = {
	"Я весь вспотел",
	"Эта жара меня добьёт",
	"У меня одежда вся сырая",
	"Мне нужно охладиться...",
	"Это слишком жарко",
	"Мне от жары, плохо станет",
	"Почему тут так жарко?",
}

local heatstroke_phraselist = {
	"МНЕ НУЖНА ВОДА!!!",
	"Пожалуйста... воды...",
	"Я чувствую головокружение...",
	"МОЯ ГОЛОВА! Она болит...",
	"Моя голова раскалывается",
    "Я словил солнечный удар?"
}

local heatvomit_phraselist = {
	"От жары... меня тошнит...",
	"Меня сейчас... вырвет...",
	"Я... блять...",
    "Грх...",
    "Сейчас блевану..."
}

local hg_showthoughts = ConVarExists("hg_showthoughts") and GetConVar("hg_showthoughts") or CreateClientConVar("hg_showthoughts", "1", true, true, "Toggle thoughts of your character", 0, 1)

function string.Random(length)
	local length = tonumber(length)

    if length < 1 then return end

    local result = {}

    for i = 1, length do
        result[i] = allowedchars[math.random(#allowedchars)]
    end

    return table.concat(result)
end

function hg.nothing_happening(ply)
	if not IsValid(ply) then return end

	return ply.organism and ply.organism.fear < -0.6
end

function hg.fearful(ply)
	if not IsValid(ply) then return end

	return ply.organism and ply.organism.fear > 0.5
end

function hg.likely_to_phrase(ply)
	local org = ply.organism

	local pain = org.pain
	local brain = org.brain
	local blood = org.blood
	local fear = org.fear
	local temperature = org.temperature
	local broken_dislocated = org.just_damaged_bone and ((org.just_damaged_bone - CurTime()) < -3)

	return (broken_dislocated) and 5
		or (pain > 65) and 5
		or (temperature < 31 and 0.5)
		or (temperature > 38 and 0.5)
		or (blood < 3000 and 0.3)
		or (fear > 0.5 and 0.7)
		or (brain > 0.1 and brain * 5)
		or (fear < -0.5 and 0.05)
		or -0.1
end

function IsAimedAt(ply)
    return ply.aimed_at or 0
end

local function get_status_message(ply)
	if not IsValid(ply) then
		if CLIENT then
			ply = lply
		else
			return
		end
	end

	local nomessage = hook.Run("HG_CanThoughts", ply)
	if nomessage ~= nil and nomessage == false then return "" end

    if ply:GetInfoNum("hg_showthoughts", 1) == 0 then return "" end

	local org = ply.organism
	
	if not org or not org.brain then return "" end

	local pain = org.pain
	local brain = org.brain
	local temperature = org.temperature
	local blood = org.blood
	local hungry = org.hungry
	local broken_dislocated = org.just_damaged_bone and ((org.just_damaged_bone + 3 - CurTime()) < -3)
	local fear = org.fear
	local adrenaline = org.adrenaline

	if broken_dislocated and org.just_damaged_bone then
		org.just_damaged_bone = nil
	end
	
	local broken_notify = (org.rarm == 1) or (org.larm == 1) or (org.rleg == 1) or (org.lleg == 1)
	local dislocated_notify = (org.rarm == 0.5) or (org.larm == 0.5) or (org.rleg == 0.5) or (org.lleg == 0.5)
	local after_unconscious_notify = org.after_otrub

	if not isnumber(pain) then return "" end

	local str = ""

	local most_wanted_phraselist
	
	if temperature < 35 then
		most_wanted_phraselist = temperature > 31 and cold_phraselist or (temperature < 28 and numb_phraselist or freezing_phraselist)
	elseif temperature > 38 then
		most_wanted_phraselist = temperature < 40 and hot_phraselist or heatstroke_phraselist
	end

	if not most_wanted_phraselist and hungry and hungry > 25 and math.random(3) == 1 then
		most_wanted_phraselist = hungry > 45 and very_hungry or hungry_a_bit
	end

	if (blood < 3100) or (pain > 75) or (broken_dislocated) or (broken_notify) or (dislocated_notify) then
		if pain > 75 and (broken_dislocated) then
			most_wanted_phraselist = math.random(2) == 1 and audible_pain or (broken_notify and broken_limb or dislocated_limb)
		elseif pain > 75 then
			most_wanted_phraselist = audible_pain
		elseif broken_dislocated then
			most_wanted_phraselist = (broken_notify and broken_limb or dislocated_limb)
		end

		if pain > 100 then
			most_wanted_phraselist = sharp_pain
		end

		if not most_wanted_phraselist then
			if (broken_dislocated_notify) and (blood < 3100) then
				most_wanted_phraselist = blood < 2900 and (near_death_poetic) or (math.random(2) == 1 and (broken_notify and broken_limb or dislocated_limb) or near_death_poetic)
			--elseif(broken_dislocated_notify)then
				--most_wanted_phraselist = (broken_notify and broken_limb or dislocated_limb)
			elseif(blood < 3100)then
				if adrenaline > 1.3 and fear < 0.5 then
					most_wanted_phraselist = near_death_positive
				else
					most_wanted_phraselist = near_death_poetic
				end
			end
		end
	elseif after_unconscious_notify then
		most_wanted_phraselist = after_unconscious
	elseif hg.nothing_happening(ply) then
		most_wanted_phraselist = random_phrase

		if hungry and hungry > 25 and math.random(5) == 1 then
			most_wanted_phraselist = hungry > 45 and very_hungry or hungry_a_bit
		end
	elseif hg.fearful(ply) then
		most_wanted_phraselist = ((IsAimedAt(ply) > 0.9) and is_aimed_at_phrases or (math.random(10) == 1 and fear_hurt_ironic or fear_phrases))
	end

	if brain > 0.1 then
		most_wanted_phraselist = brain < 0.2 and slight_braindamage_phraselist or braindamage_phraselist
	end
	
	if most_wanted_phraselist then
		str = most_wanted_phraselist[math.random(#most_wanted_phraselist)]

		return str
	else
		return ""
	end
end

local allowedlist_types = {
	heatvomit = heatvomit_phraselist,
}

function hg.get_phraselist(ply, type)
	if not IsValid(ply) then
		if CLIENT then
			ply = lply
		else
			return
		end
	end
	
	local NoMessage = ply.PlayerClassName == "Gordon" or ply.PlayerClassName == "Combine"

	if NoMessage then return "" end
    
    if ply:GetInfoNum("hg_showthoughts", 1) == 0 then return "" end

	local org = ply.organism	
	if not org or not org.brain then return "" end

	if not isstring(type) or not allowedlist_types[type] then return "" end

	local needed_list = allowedlist_types[type]

	local str = needed_list[math.random(#needed_list)]
	return str
end

function hg.get_status_message(ply)
	local txt = get_status_message(ply)

	return txt
end
