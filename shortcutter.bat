@echo off

set "_folder=%programdata%\U3BvdHRlcg"
set "_smprograms=%programdata%\Microsoft\Windows\Start Menu\Programs"

if not exist "%_folder%\create_shortcuts.vbs" (
    (
        echo:Set oWS = WScript.CreateObject^("WScript.Shell"^)
        echo:Set oSpotter = oWS.CreateShortcut^("%_folder%\SpotX.lnk"^)
        echo:
        echo:oSpotter.TargetPath = "%_folder%\spotter.bat"
        echo:oSpotter.IconLocation = "%_folder%\spotter.ico" & ",0"
        echo:
        echo:oSpotter.Save
    ) > "%_folder%\create_shortcuts.vbs"
)
cscript //nologo "%_folder%\create_shortcuts.vbs"
copy "%_folder%\SpotX.lnk" "%_smprograms%\SpotX.lnk" /y