local PANEL = {}

function PANEL:Init()
    self:SetSize(ScrW() * .031, ScrH() * .03)
    self:SetChecked(false)
    self.DATA = {
        ["rounded"] = 0,
        ["colors"] = {
            ["background"] = Color(206, 206, 206),
            ["enabled"] = Color(56, 172, 108),
            ["disabled"] = Color(185, 50, 50)
        },
        ["geometry"] = {
            x = 0,
            y = 0
        },
        ["checked"] = utf8.char(0xf058),
        ["unchecked"] = utf8.char(0xf057)
    }
    self.curColor = self.DATA["colors"]["disabled"]
    self.curSign = self.DATA["unchecked"]
    self.signColor = self.DATA["colors"]["disabled"]
    self.font = "FALightCheckBox"

end

function PANEL:Paint(w, h)
    self.curColor = self:GetChecked() and CAPTURESYSTEMFUNCTIONS.LerpColor(self.curColor, self.DATA["colors"]["enabled"], FrameTime() * 10) or CAPTURESYSTEMFUNCTIONS.LerpColor(self.curColor, self.DATA["colors"]["disabled"], FrameTime() * 10)
    self.signColor = self:GetChecked() and CAPTURESYSTEMFUNCTIONS.LerpColor(self.signColor, self.DATA["colors"]["enabled"], FrameTime() * 10) or CAPTURESYSTEMFUNCTIONS.LerpColor(self.signColor, self.DATA["colors"]["disabled"], FrameTime() * 10)
    if self:GetChecked() then
        self.curSign = self.DATA["checked"]
    else
        self.curSign = self.DATA["unchecked"]
    end
    self.DATA["rounded"] = h / 2
    self.DATA["geometry"].x = self:GetChecked() and Lerp(FrameTime() * 10, self.DATA["geometry"].x, w - w / 4) or Lerp(FrameTime() * 10, self.DATA["geometry"].x, w / 4)
    self.DATA["geometry"].y = h / 2


    draw.RoundedBox(self.DATA["rounded"], 0, 0, w, h, self.curColor)
    CAPTURESYSTEMFUNCTIONS.DrawCircle(self.DATA["geometry"].x, self.DATA["geometry"].y, w / 4.8, 0, 360, self.DATA["colors"]["background"])
    draw.SimpleText(self.curSign, self.font, self.DATA["geometry"].x, self.DATA["geometry"].y, self.signColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

function PANEL:OnChange(bVal)
    if not bVal then
        self.curSign = self.DATA["unchecked"]
    else
        self.curSign = self.DATA["checked"]
    end
end


vgui.Register("ChCheckBox", PANEL, "DCheckBox")
