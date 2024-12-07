Add-Type -AssemblyName System.Windows.Forms

[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
[void] [System.Reflection.Assembly]::LoadWithPartialName("PresentationFramework")
[void] [Reflection.Assembly]::LoadWithPartialName("PresentationCore")

$gui = New-Object System.Windows.Forms.Form

$gui.ClientSize = '500,400'
$gui.text = "Test - posh"
$gui.BackColor = "#333333"

$Title = New-Object system.Windows.Forms.Label
$Title.text = "Logs Analysis"
$Title.AutoSize = $true
$Title.height = 10
$Title.width = 25
$Title.location = New-Object System.Drawing.Point(20,20)
$Title.Font = 'Microsoft Sans Serif,14'
$Title.ForeColor = '#FFFFFF'

$Title2 = New-Object system.Windows.Forms.Label
$Title2.text = "Logs Analysis"
$Title2.AutoSize = $true
$Title2.height = 10
$Title2.width = 25
$Title2.location = New-Object System.Drawing.Point(20,20)
$Title2.Font = 'Microsoft Sans Serif,14'
$Title2.ForeColor = '#FFFFFF'

$StoreLabel = New-Object system.Windows.Forms.Label
$StoreLabel.text = "Select Store"
$StoreLabel.AutoSize = $false
$StoreLabel.height = 50
$StoreLabel.width = 450
$StoreLabel.location = New-Object System.Drawing.Point(20,50)
$StoreLabel.Font = 'Microsoft Sans Serif,10'
$StoreLabel.ForeColor = '#FFFFFF'

$LabelStatus = New-Object system.Windows.Forms.Label
$LabelStatus.text = "Status:"
$LabelStatus.AutoSize = $true
$LabelStatus.location = New-Object System.Drawing.Point(20,115)
$LabelStatus.Font = 'Microsoft Sans Serif,10,style=Bold'
$LabelStatus.ForeColor = '#FFFFFF'

$LabelStatus2 = New-Object system.Windows.Forms.Label
$LabelStatus2.text = "Searching for patterns..."
$LabelStatus2.AutoSize = $true
$LabelStatus2.location = New-Object System.Drawing.Point(75,115)
$LabelStatus2.Font = 'Microsoft Sans Serif,10'
$LabelStatus2.ForeColor = '#FFFFFF'

$TextBox1 = New-Object system.Windows.Forms.TextBox
$TextBox1.multiline = $false
$TextBox1.width = 314
$TextBox1.height = 20
$TextBox1.location = New-Object System.Drawing.Point(100,180)
$TextBox1.Font = 'Microsoft Sans Serif,10'
$TextBox1.Visible = $false

$Button1 = New-Object System.Windows.Forms.Button
$Button1.BackColor = "#FFFFFF"
$Button1.text = "Process"
$Button1.width = 90
$Button1.height = 30
$Button1.location = New-Object System.Drawing.Point(370,250)
$Button1.Font = 'Microsoft Sans Serif,10'
$Button1.ForeColor = "#000000"
$Button1.Add_Click({ LogText })

$Tab1_Button1 = New-Object System.Windows.Forms.Button
$Tab1_Button1.Location = New-Object System.Drawing.Size(100,120)
$Tab1_Button1.Size = New-Object System.Drawing.Size(100,33)
$Tab1_Button1.Text = "CLOSE!..."
$Tab1_Button1.BackColor = "#FFFFFF"
$Tab1_Button1.ForeColor = "#000000"
$Tab1_Button1.Font = [System.Drawing.Font]::new("Arial", 9, [System.Drawing.FontStyle]::Regular)
$Tab1_Button1.Add_Click($t1_button_click1)

$Tab2_Button1 = New-Object System.Windows.Forms.Button
$Tab2_Button1.Location = New-Object System.Drawing.Size(200,120)
$Tab2_Button1.Size = New-Object System.Drawing.Size(100,33)
$Tab2_Button1.Text = "CLOSE"
$Tab2_Button1.BackColor = "#FFFFFF"
$Tab2_Button1.ForeColor = "#000000"
$Tab2_button1.Font = [System.Drawing.Font]::new("Arial", 9, [System.Drawing.FontStyle]::Regular)
$Tab2_Button1.Add_Click($t2_button_click1)

$cancelBtn = New-Object System.Windows.Forms.Button
$cancelBtn.BackColor = "#ffffff"
$cancelBtn.ForeColor = "#000000"
$cancelBtn.text = "Close"
$cancelBtn.width = 90
$cancelBtn.height = 30
$cancelBtn.location = New-Object System.Drawing.Point(260,250)
$cancelBtn.Font = 'Microsoft Sans Serif,10'
$cancelBtn.ForeColor = "#000"
$cancelBtn.DialogResult = [System.Windows.Forms.DialogResult]::Cancel

$LogType = New-Object system.Windows.Forms.ComboBox
$LogType.text = ""
$LogType.width = 170
$LogType.height = 20
@('Log1','Log2') | ForEach-Object {[void] $LogType.Items.Add($_)}
$LogType.SelectedIndex = 0
$LogType.location = New-Object System.Drawing.Point(100,210)
$LogType.Font = 'Microsoft Sans Serif,10'
$LogType.Visible = $true

# Tab Controls
$FormTabControl = New-object System.Windows.Forms.TabControl
$FormTabControl.Size = "500,400"
$FormTabControl.Location = "0,0"
$FormTabControl.BackColor = "#BBBBBB"
$FormTabControl.ForeColor = "#777777"
$FormTabControl.Font = [System.Drawing.Font]::new("Arial", 13, [System.Drawing.FontStyle]::Regular)

$Tab1 = New-object System.Windows.Forms.Tabpage
$Tab1.DataBindings.DefaultDataSourceUpdateMode = 0
$Tab1.UseVisualStyleBackColor = $false
$Tab1.BackColor = "#000000"
$Tab1.Name = "Team1"
$Tab1.Text = "TAB1"
# $gui.Controls.Add($Tab1)

$Tab2 = New-object System.Windows.Forms.Tabpage
$Tab2.DataBindings.DefaultDataSourceUpdateMode = 0
$Tab2.UseVisualStyleBackColor = $True 
$Tab2.BackColor = "#000000"
$Tab2.Name = "Team2" 
$Tab2.Text = "TAB2"
# $gui.Controls.Add($Tab2)

# FUNCTIONS ==============
function LogText
{
    Write-Host "pressed..."
}

# Tab1 - Button1 - Close
function t1_button_click1()
{
    [System.Windows.Forms.MessageBox]::Show("Tab 1")
}

# Tab2 - Button1 - Close
$t2_button_click1 = {
    [System.Windows.Forms.MessageBox]::Show("Tab 2")
}



# validation
if ($result –eq [System.Windows.Forms.DialogResult]::Cancel)
{
    write-output 'User pressed cancel'
}

# app configuration
# $gui.CancelButton = $cancelBtn
# $gui.Controls.Add($cancelBtn)
$Tab1.controls.AddRange(@($Title,$StoreLabel,$LabelStatus,$TextBox1,$LabelStatus2,$Button1,$LogType,$Tab2_Button1,$Tab1_Button1))
$Tab2.controls.AddRange(@($Title2,$Button1,$cancelBtn,$Tab1_Button1,$Tab2_Button1))
$FormTabControl.Controls.Add($Tab1)
$FormTabControl.Controls.Add($Tab2)

$gui.controls.AddRange(@($FormTabControl))
$gui.Add_Shown.({$gui.Activate()})

# run app
# [void]$gui.ShowDialog()
$result = $gui.ShowDialog()
