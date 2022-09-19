local Module = {}

function Module.Instance(instance : string,properties : table)
    local Corner
    local Stroke
    local CreatedInstance = Instance.new(instance)

    for property,value in next,properties do
        if tostring(property) ~= "CornerRadius" or tostring(property) ~= "Stroke" then
            CreatedInstance[property] = value
        elseif tostring(value) == "Stroke" then
            Stroke = Instance.new("UIStroke",CreatedInstance)
            Stroke.Color = value["Color"]
            Stroke.Thickness = value["Thick"]
            Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            Stroke.Transparency = value["Tranparency"]
            Stroke.LineJoinMode = Enum.LineJoinMode.Round
        elseif tostring(property) == "CornerRadius" then
            Corner = Instance.new("UICorner",CreatedInstance)
            Corner.CornerRadius = value
        end
    end

    return CreatedInstance;
end

return Module;
