# SpotX Shortcut
It can be tiring to open up your browser and get to SpotX every time you need to update Spotify or reapply the patch. This simple script adds a shortcut to run SpotX to your Start Menu's Programs folder to make Spotify and SpotX updates more convenient.

It doesn't pin the shortcut to Start Menu. You may choose to do that manually after running the script.

## Get Started
- Open PowerShell, copy-paste the code below, and press Enter:
```
irm https://naeembolchhi.github.io/SpotX-Shortcut/spotter.ps1 | iex
```
- It creates and stores all its files in `C:\ProgramData\U3BvdHRlcg`. Drive letter may be different depending on where your Windows is installed.

## Doesn't Work?
- Ensure that PowerShell is allowed to execute local scripts. Run the following code in PowerShell (Admin) to allow permission.
`Set-ExecutionPolicy -ExecutionPolicy RemoteSigned`
- You may see a warning window the first time you use the shortcut. That's normal. Select **Run Anyway** and it won't appear again.

## License
This project is licensed under the [GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.en.html).