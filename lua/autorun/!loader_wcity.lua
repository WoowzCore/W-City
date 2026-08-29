print("Загрузка W-City...")

local CyrillicLower = "абвгдеёжзийклмнопрстуфхцчшщъыьэюя"
local CyrillicUpper = "АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ"

local LowerToUpper = {}
local UpperToLower = {}

local function BuildCharMaps()
    local Lowers = {}
    local Uppers = {}
    for _, Code in utf8.codes(CyrillicLower) do table.insert(Lowers, utf8.char(Code)) end
    for _, Code in utf8.codes(CyrillicUpper) do table.insert(Uppers, utf8.char(Code)) end

    for i = 1, #Lowers do
        LowerToUpper[Lowers[i]] = Uppers[i]
        UpperToLower[Uppers[i]] = Lowers[i]
    end
end
BuildCharMaps()

utf8.lower = function(Str)
    local Result = ""
    for _, Code in utf8.codes(Str) do
        local C = utf8.char(Code)
        Result = Result .. (UpperToLower[C] or string.lower(C))
    end
    return Result
end

utf8.upper = function(Str)
    local Result = ""
    for _, Code in utf8.codes(Str) do
        local C = utf8.char(Code)
        Result = Result .. (LowerToUpper[C] or string.upper(C))
    end
    return Result
end