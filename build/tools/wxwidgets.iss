; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#if GetEnv("INNO") != ""
    #define WXW_DIR GetEnv("INNO")
#else
    #define WXW_DIR "..\.."
#endif

#if GetEnv("WXW_VER") == "SVN"
    #define INFOFILE  WXW_DIR + "\BuildSVN.txt"
    #define WX_VERSION "SVN"
#elif GetEnv("WXW_VER") != ""
    #define INFOFILE WXW_DIR + "\docs\msw\install.txt"
    #define WX_VERSION GetEnv("WXW_VER")
#else
    #error "WXW_VER environment variable must be defined."
#endif

#define SETUPFILENAME  "wxMSW-" + GetEnv("WXW_VER") + "-Setup"



[Setup]
AppName=wxWidgets
AppVerName=wxWidgets {#WX_VERSION}
AppPublisher=wxWidgets
AppPublisherURL=http://www.wxwidgets.org
AppSupportURL=http://www.wxwidgets.org
AppUpdatesURL=http://www.wxwidgets.org
DefaultDirName={sd}\wxWidgets-{#WX_VERSION}
DefaultGroupName=wxWidgets {#WX_VERSION}
UsePreviousAppDir=no
DisableProgramGroupPage=yes
LicenseFile={#WXW_DIR}\docs\licence.txt
InfoBeforeFile={#WXW_DIR}\docs\readme.txt
InfoAfterFile={#INFOFILE}
OutputDir={#WXW_DIR}\..
OutputBaseFilename={#SETUPFILENAME}
PrivilegesRequired=none
SetupIconFile={#WXW_DIR}\art\wxwin.ico
Compression=lzma
SolidCompression=yes

[Files]
; source files
Source: "{#WXW_DIR}\*"; DestDir: "{app}"; Excludes: ".cvsignore,cocoa,dfb,mac,gtk,gtk1,motif,msdos,os2,wxWindows.xcod*,x11,debian,distrib,docs,misc,tests,wxPython,*.pch,*.pch++,*.pchmm"; Flags: ignoreversion recursesubdirs createallsubdirs
; docs and helpfile
Source: "{#WXW_DIR}\docs\htmlhelp\*"; DestDir: "{app}\docs\htmlhelp\";  Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#WXW_DIR}\docs\licence.txt"; DestDir: "{app}\docs\";  Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#WXW_DIR}\docs\readme.txt"; DestDir: "{app}\docs\";  Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#WXW_DIR}\docs\changes.txt"; DestDir: "{app}\docs\";  Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#WXW_DIR}\docs\msw\install.txt"; DestDir: "{app}\docs\msw";  Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[INI]
Filename: "{app}\wx.url"; Section: "InternetShortcut"; Key: "URL"; String: "http://www.wxwidgets.org"

[Icons]
Name: "{group}\{cm:ProgramOnTheWeb,wxWidgets}"; Filename: "{app}\wx.url"
Name: {group}\wxWidgets Manual; Filename: {app}\docs\htmlhelp\wx.chm; WorkingDir: {app}; IconIndex: 0; Flags: useapppaths
Name: {group}\Changes; Filename: {app}\docs\changes.txt; WorkingDir: {app}; IconIndex: 0; Flags: useapppaths
Name: {group}\Readme; Filename: {app}\docs\readme.txt; WorkingDir: {app}; IconIndex: 0; Flags: useapppaths
Name: {group}\Compiling wxWidgets; Filename: {app}\docs\msw\install.txt; WorkingDir: {app}; IconIndex: 0; Flags: useapppaths
Name: "{group}\Uninstall wxWidgets {#WX_VERSION}"; Filename: "{uninstallexe}"


[UninstallDelete]
Type: files; Name: "{app}\wx.url"
