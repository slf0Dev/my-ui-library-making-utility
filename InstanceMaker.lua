local Module = {}

function Module.Instance(instance : string,properties : table)
    local CreatedInstance
    local Corner
    CreatedInstance = Instance.new(instance)

    for property,value in next,properties do
        if tostring(property) ~= "CornerRadius" then
            CreatedInstance[property] = value
        else
            Corner = Instance.new("UICorner",CreatedInstance)
            Corner.CornerRadius = value
        end
    end

    return CreatedInstance;
end

return Module;
