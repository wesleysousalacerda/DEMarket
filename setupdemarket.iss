; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{44367F58-3404-4274-B1DE-6EFB540CD2B3}
AppName=DEMarket
AppVersion=1.0
;AppVerName=DEMarket 1.0
AppPublisher=Intera �.
AppPublisherURL=http://www.intera.com/
AppSupportURL=http://www.intera.com/
AppUpdatesURL=http://www.intera.com/
DefaultDirName={pf}\DEMarket
DefaultGroupName=DEMarket
LicenseFile=D:\coisas\SUPERMERCADO\Licen�a.txt
InfoAfterFile=D:\coisas\SUPERMERCADO\Manual demarket.txt
OutputDir=C:\SETUP
OutputBaseFilename=setup
SetupIconFile=D:\coisas\SUPERMERCADO\demarketingico.ico
Password=acessorestrito
Compression=lzma
SolidCompression=yes

[Languages]
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "D:\coisas\SUPERMERCADO\EXE\Supermercado.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\coisas\SUPERMERCADO\bd\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\DEMarket"; Filename: "{app}\Supermercado.exe"
Name: "{commondesktop}\DEMarket"; Filename: "{app}\Supermercado.exe"; Tasks: desktopicon

[Run]
Filename: "{app}\Supermercado.exe"; Description: "{cm:LaunchProgram,DEMarket}"; Flags: nowait postinstall skipifsilent

