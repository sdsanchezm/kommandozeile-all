# Windows Management Console (msc) Commands

- win + R to run
	- regular user: [enter]
	- admin user: [ctrl] + [shift] + [enter]

## Table of Contents

- [Windows Management Console (msc) Commands](#windows-management-console-msc-commands)
  - [Windows user](#windows-user)
    - [Location](#location)
    - [Advance Properties](#advance-properties)
    - [Disk Cleanup](#disk-cleanup)
  - [Windows Server](#windows-server)
  - [Windows Debloat Considerations using powershell](#windows-debloat-considerations-using-powershell)
    - [List installed apps (current user)](#list-installed-apps-current-user)
    - [Remove an app for the current user](#remove-an-app-for-the-current-user)
    - [Provisioned packages (new users / reinstalls)](#provisioned-packages-new-users--reinstalls)
    - [Optional features and capabilities](#optional-features-and-capabilities)
    - [Safer defaults / what to leave alone](#safer-defaults--what-to-leave-alone)
    - [Reinstall a Store app later](#reinstall-a-store-app-later)
    - [Related cleanup (not Appx)](#related-cleanup-not-appx)

## Windows user

- azman.msc
	- Authorization Manager	Manage Authorization Stores
- certlm.msc
	- Certificates Local Computer	Loads the list of certificates of the local computer.
- certmgr.msc
	- Certificates - Loads the list of certificates of the user
- comexp.msc
	- Component Services - Loads Component Services, Event Viewer, and Services.
- compmgmt.msc
	- Computer Management - Includes System Tools (Task Scheduler, Event Viewer, Shared Folders, Local Users and Groups, - Performance and Device Manager), Storage (Disk Management), and Services and Applications (Services and WMI Control)
- devmgmt.msc
	- Device Manager - Opens the Device Manager to manage hardware and devices.
- devmoderunasuserconfig.msc
	- User Manager - Complete customization of the start menu items and the taskbar.
- dfrg.msc
	- Disk Defragmenter - Windows 2000, Windows XP, and Windows Server 2003. Later Windows opens Disk Defragmenter with `dfrgui`.
- diskmgmt.msc
	- Disk Management - Opens Disk Management to administrate connected storage devices.
- eventvwr.msc
	- Event Viewer - Opens the Event Viewer which displays operating system, software, and hardware events.
- fsmgmt.msc
	- Shared Folders - Loads the list of shared folders, sessions, and open files
- gpedit.msc
	- Group Policy Editor - Loads the Group Policy Editor to manage system policies
- lusrmgr.msc
	- Local Users and Groups - Interface to manage local users and user groups.
	- Here the expiry windows password setting can be changed along with other user related settings
- ntmsmgr.msc
	- Removable Storage - Manage libraries, drives, media, and media pools. Windows XP and Windows Server 2003.
- ntmsoprq.msc
	- Removable Storage Operator Requests - Complete or refuse operator requests for removable media. Windows XP and Windows Server 2003.
- perfmon.msc
	- Performance Monitor - Loads the Windows Performance Monitor
- printmanagement.msc
	- Print Management - Manage printers.
- rsop.msc
	- Resultant Set of Policies - List policies, full results only available through command line tool gpresult
- secpol.msc
	- Local Security Policy - Loads policies such as account policies, public key policies, or advanced audit policy - configuration
- services.msc
	- Services Manager - Loads the list of installed services to manage them.
- taskschd.msc
	- Task Scheduler - Loads the Task Scheduler to manage tasks
- tpm.msc
	- Trusted Platform Module Management - Manage the TPM on the local device.
- wf.msc
	- Windows Firewall - Starts Windows Firewall with Advanced Security.
- wmimgmt.msc
	- WMI Management - Configure and Control the Windows Management Instrumentation Service.

### Location

- The default location of .msc files is `Windows\System32`

### Advance Properties

- `SystemPropertiesAdvanced`
- `sysdm.cpl`
- System Variables from cmd (PATH included)
	- `rundll32 sysdm.cpl,EditEnvironmentVariables`

### Disk Cleanup

`cleanmgr` is Disk Cleanup (`cleanmgr.exe`), not an `.msc` console. It clears unnecessary files from a disk.

- `cleanmgr`
- `cleanmgr /d C`
	- Clean drive C. Not used together with `/sagerun`
- `cleanmgr /sageset:n`
	- Open the settings dialog and store the selection as set `n` (`0` through `9999`)
- `cleanmgr /sagerun:n`
	- Run the tasks saved for set `n` against every drive
- `cleanmgr /tuneup:n`
	- Run `/sageset` and `/sagerun` for the same `n`
- `cleanmgr /lowdisk`
	- Run with the default settings
- `cleanmgr /verylowdisk`
	- Run with the default settings and no prompts
- `cleanmgr /autoclean`
	- Delete files left behind after a Windows upgrade

## Windows Server

.MSC file
Description
- adfs.msc
	- Active Directory Federation Services
- admgmt.msc
	- Active Directory Management - Domains and Trusts, Sites and Services, DNS, and Active Directory Users and Computers. Windows Server 2003 Administration Tools Pack.
- AdRmsAdmin.msc
	- Active Directory Rights Management Services
- adrms.msc
	- Active Directory Rights Management Services - Documented snap-in name. The AD RMS role installs `AdRmsAdmin.msc`.
- adsiedit.msc
	- ADSI Edit
- certim.msc
	- Local Computer Certificates
- certsrv.msc
	- Certification Authority
- certtmpl.msc
	- Certification Templates
- ciadv.msc
	- Indexing Service
- cluadmin.msc
	- Failover Cluster Manager
- da6to4.msc
	- Network Interfaces Performance Monitor
- daihttps.msc
	- HTTPS Traffic Performance Monitor
- daipsecdos.msc
	- IPSec Performance Monitor
- daisatapmsc
	- ISATAP Performance Monitor
- dfsgui.msc
	- Distributed File System - Windows Server 2003. Windows Server 2003 R2 and later use `dfsmgmt.msc`.
- dfsmgmt.msc
	- DFS Management
- dhcpmgmt.msc
	- DHCP Management
- dnsmgmt.msc
	- DNS Manager
- domain.msc
	- Active Directory Domains and Trust
- dsa.msc
	- Active Directory Users and Computers.
- dssite.msc
	- Active Directory Sites and Services
- fsrm.msc
	- File Server Resource Manager
- fxsadmin.msc
	- Microsoft Fax Service Manager
- gpmc.msc
	- Group Policy Management
- gpme.msc
	- Group Policy Mangement Editor
- gptedit.msc
	- Group Policy Starter GPO Editor
- hcscfg.msc
	- Health Registration Authority
- idmumgmt.msc
	- Microsoft Identity Management for Unix
- iis.msc
	- Internet Information Services Manager
- iis6.msc
	- Internet Information Services Manager 6.0
- ipaddrmgmt.msc
	- IP Address Management - WINS, DNS, and DHCP in one console. Windows Server 2003 Administration Tools Pack.
- lsdiag.msc
	- RD Licensing Diagnoser
- napclcfg.msc
	- NAP Client Configuration
- mfsmgmt.msc
	- Services for Network File System
- nps.msc
	- Network Policy Server
- ocsp.msc
	- Online Responder
- pkiview.msc
	- Enterprise PKI
- pkmgmt.msc
	- PKI Management - Certification authorities and certificate templates. Windows Server 2003 Administration Tools Pack.
- remoteprograms.msc
	- RemoteApp Manager
- rrasmgmt.msc
	- Routing and Remote Access
- rsadmin.msc
	- Remote Storage Administration - Windows 2000 Server and Windows Server 2003.
- sanmmc.msc
	- Storage Manager for SANs
- sbmgr.msc
	- Remote Desktop Connection Manager
- scanmanagement.msc
	- Scan Management
- schmmgmt.msc
	- Active Directory Schema - Register the snap-in with `regsvr32 schmmgmt.dll`, then save the console as `schmmgmt.msc`.
- servermanager.msc
	- Server Manager
- storagemgmt.msc
	- Share and Storage Management
- storexpl.msc
	- Storage Explorer
- tapimgmt.msc
	- Telephony
- tsadmin.msc
	- Remote Desktop Services Manager
- tscc.msc
	- Terminal Services Configuration - Windows Server 2003. Later releases use `tsconfig.msc`.
- tsconfig.msc
	- Remote Desktop Session Host Configuration
- tsgateway.msc
	- RD Gateway Manager
- tsmmc.msc
	- Remote Desktops
- uddi.msc
	- UDDI Services
- virtmgmt.msc
	- Hyper-V Manager
- wbadmin.msc
	- Windows Server Backup
- Wdsmgmt-msc
	- Windows Deployment Services
- winsmgmt.msc
	- WINS
- wbiadmin.msc
	- Windows Server Backup
- wsrm.msc
	- Windows System Resource Manager
- wsus.msc
	- Update Services

## Windows Debloat Considerations using powershell

Windows 11 ships with many preinstalled Store / UWP apps. Debloat usually means removing or disabling apps you do not use. Prefer listing first, remove selectively, and keep a restore path.

- Run PowerShell as Administrator for machine-wide / provisioned package changes
- Create a restore point before bulk removals:
	- `Checkpoint-Computer -Description "Before debloat" -RestorePointType MODIFY_SETTINGS`

### List installed apps (current user)

- All Appx packages for the current user:
	- `Get-AppxPackage | Select-Object Name, PackageFullName | Sort-Object Name`
- Filter by name:
	- `Get-AppxPackage *xbox*`
	- `Get-AppxPackage *bing*`
	- `Get-AppxPackage *teams*`
	- `Get-AppxPackage *clipchamp*`
	- `Get-AppxPackage *copilot*`

### Remove an app for the current user

- Example (Xbox app):
	- `Get-AppxPackage *XboxApp* | Remove-AppxPackage`
- Example (common consumer packages; adjust names after listing):
	- `Get-AppxPackage *BingNews* | Remove-AppxPackage`
	- `Get-AppxPackage *BingWeather* | Remove-AppxPackage`
	- `Get-AppxPackage *GetHelp* | Remove-AppxPackage`
	- `Get-AppxPackage *Microsoft.Getstarted* | Remove-AppxPackage`
	- `Get-AppxPackage *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage`
	- `Get-AppxPackage *Microsoft.WindowsFeedbackHub* | Remove-AppxPackage`
	- `Get-AppxPackage *Microsoft.YourPhone* | Remove-AppxPackage`
	- `Get-AppxPackage *Microsoft.ZuneMusic* | Remove-AppxPackage`
	- `Get-AppxPackage *Microsoft.ZuneVideo* | Remove-AppxPackage`
	- `Get-AppxPackage *Clipchamp* | Remove-AppxPackage`
	- `Get-AppxPackage *MicrosoftTeams* | Remove-AppxPackage`
	- `Get-AppxPackage *Microsoft.GamingApp* | Remove-AppxPackage`

### Provisioned packages (new users / reinstalls)

Apps provisioned for the image come back for new local accounts unless also removed from the provisioned list.

- List provisioned packages:
	- `Get-AppxProvisionedPackage -Online | Select-Object DisplayName, PackageName | Sort-Object DisplayName`
- Remove a provisioned package (admin):
	- `Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like "*BingNews*" | Remove-AppxProvisionedPackage -Online`

### Optional features and capabilities

- List optional features:
	- `Get-WindowsOptionalFeature -Online | Where-Object State -eq Enabled | Select-Object FeatureName`
- Disable an optional feature (example):
	- `Disable-WindowsOptionalFeature -Online -FeatureName WindowsMediaPlayer -NoRestart`
- List installed capabilities:
	- `Get-WindowsCapability -Online | Where-Object State -eq Installed | Select-Object Name`
- Remove a capability (example: OpenSSH client if unused):
	- `Remove-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0`

### Safer defaults / what to leave alone

- Prefer not removing without a clear reason:
	- Microsoft Store (`Microsoft.WindowsStore`) — needed to reinstall Store apps
	- App Installer / Winget-related packages
	- Windows Security / Defender UI packages
	- Photos, Calculator, Notepad, Terminal (or keep Terminal if you use it)
	- Xbox Identity Provider / Gaming Services if you use Xbox / Game Pass / some games
- Feature updates and major Windows 11 upgrades can re-provision apps; re-check after upgrades
- Third-party “one-click debloat” scripts vary in quality; review every removal before running them

### Reinstall a Store app later

- From Microsoft Store, or with winget when available:
	- `winget search <app-name>`
	- `winget install <package-id>`
- Or re-register Store apps for the current user (recovery when Store apps break):
	- `Get-AppxPackage -AllUsers Microsoft.WindowsStore | ForEach-Object { Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppxManifest.xml" }`

### Related cleanup (not Appx)

- Disk Cleanup (see [Disk Cleanup](#disk-cleanup)): `cleanmgr`
- Temporary files:
	- `Remove-Item -Path $env:TEMP\* -Recurse -Force -ErrorAction SilentlyContinue`
- Startup apps UI:
	- `Taskmgr` → Startup apps
	- or Settings → Apps → Startup
