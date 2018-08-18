# WARNING
This version of SAxVCxLC and the installation are still work-in-progress. Some things do not work yet.
------------------
Contents
 * Authors, Credits/Special Thanks
 * INSTALLATION
 * Remarks for developers of SAxVCxLC
   - Principles
   - GitHub
   - File structure and installation scripts
   - Updating files during development
 * TROUBLESHOOTING, ERRORS, FAQs
 * Mods for SAxVCxLC (specifically adjusted)

# SAxVCxLC
Adds the GTA Vice City and Liberty City maps into GTA San Andreas. GTA SA remains fully playable and modable: mods for SA work also with SAxVCxLC. SAxVCxLC is clean basis for modding by external mods.

For discussions, see: http://gtaforums.com/topic/813938-saxvcxlc-vc-and-lc-in-san-andreas/

## Main Author:
PlatinumSerb

## Credits/Special Thanks:
* fastman92 - Limit Adjuster, IMG Console, Debugging 
* goodidea82 - Infrastructure, Installation
* HeicoDE - Development 8.5+
* artginPL - ENEX/Interior Markers, Patches, Conversion of music for radio
* Swoorup - PathMover, COLRenamer(old program :p), Conversion of LC and VC paths
* GTA: Liberty City Team - Use of GTA:LC map
* OpenVice(NTAuthority) - Use of Vice City map
* Silent - ASI Loader and Extended Gangs ASI
* _F_ - use of GTA VC cars Converted to SA
* CJ2000 - use of GTA VC and III vehicles
* Kam - Kam's Max Scripts 
* Deniska - 3dmax script pack
* x-men - 3dmax scripts/IMG Manager
* CLEO Team
* ThirteenAG - Project2dfx
* Junior_Djjr - Overhaul of CLEO scripts
* ZAZ - some of his CLEO mods were crucial for debugging/getting around the map.
* X-Seti - original concept of combining GTA III era cities so he deserves a shout out :p
* Squad - testing/bug reporting, map fixes
* Crspy - modloader installation fix
* inan.ahammad - added garages in VC, testing/bug reporting
* Beckerbrasil - testing/bug reporting

Thanks Rock* Games

# Installation
1. Two different ways exist to download the project (Use only ONE of them):
  * (Easy, but small UPDATES require full download and installation) Download the project as a Zip file from https://github.com/goodidea82/SAxVCxLC/releases. Extract the Zip file.
  * (Recommended because UPDATES are simple and fast): 
    - Install a git client program on your computer (For example: https://git-scm.com/download/win). 
    - Run "Git-Bash.exe" and checkout the project using "git clone https://github.com/goodidea82/SAxVCxLC".
     When SAxVCxLC gets an update you just do "git pull" to get the newest version (you don't have to download the whole zip-file again). Some info: https://services.github.com/on-demand/downloads/github-git-cheat-sheet.pdf
  
2. Click on Install.bat and follow the instructions there. Eventually additional files (radio music) will be downloaded.

If the installation script closes without asking to press a button (enter), then something went wrong. In this case run the script from cmd.exe so that the commandline window does not close and you can see what were the last words the script said.

# Remarks for developers of SAxVCxLC
## Principles
SAxVCxLC is a clean basis for modding. This means SAxVCxLC should be as close as possible to the original games and modification or additions shall be provided as external mods (except for few cases where every user agrees).

* Developing SAxVCxLC means to fix bugs; add missing things; and improve compatibility, modularity, and flexibility. Ideally all missions from VC and LC should be ported one day. The look-and-feel of the games shall remain original with priority for SA. Additional Rockstar maps may be added. In particular, original SA game must remain fully playable and modable at all times (backwards compatible with older mods). Things to keep in mind, for example:
  * Do not add/removed/modify objects in the SA map area.
  * All object IDs that were free in original SA game must remain free after SAxVCxLC installation. Do not use IDs in the range 0-20000.
  * The number of weapons, peds, cars, objects, etc. should be fixed some day (when all original things are ported). This important so that modders that provide external mods will know what are the IDs of objects for which they can provide improved versions and what are the remaining free IDs for new objects.
* Additions, modification, HD-content, scripts, etc for SAxVCxLC are very welcome. They should be provided as external mods for three reasons: (1) to advertise SAxVCxLC to new users on other websites, (2) to not force modification/addition on users, but let them customize it individually, (3) to ensure that SAxVCxLC becomes a stable basis for modding (known used/free IDs etc). Many GTA-specialized websites exists where you can publish mods. In your mod provide a Readme.txt with a link to a release version on this GitHub. Here we can provide a list of mods that link to SAxVCxLC on GitHub.
* It is also possible to create a spin-off project if publishing a mod for SAxVCxLC is not a suitable solution for some reason (e.g. a super modded version). This can be done by using "fork" to create a derived GitHub project without creating a pull-request back. This way the spin-off can benefit from updates made to SAxVCxLC and from campatibility with mods made for SAxVCxLC. The spin-off must prominently say somewhere that it is based on SAxVCxLC.

## GitHub
* Create your GitHub account, then practice Git and GitHub on a hello-world project first. It is HIGHLY recommended to install GIT on your computer (For example: https://git-scm.com/download/win) and test it with your hello-world project. You should understand (git add, git commit, git push, git pull)
* Contact us on "http://gtaforums.com/topic/813938-saxvcxlc-vc-and-lc-in-san-andreas/" so you can be included as collaborator on on this GitHub project. You can then do updates and patches on SAxVCxLC. When finished, do a pull request so that your changes will be reviewed (see Principles) and can then be merged into the master branch.
* To move and rename files/folders install GIT on your computer rather than using the web interface. Some info: https://services.github.com/on-demand/downloads/github-git-cheat-sheet.pdf
* Git configuration on windows: line endings: Checkout as-is, commit as-is (we use windows line endings)
* Do not upload big files on GitHub. The purpuse of Git is to keep track of many small files. Maxium allowed project size on GitHub is 1000 GB. 
* Let's try not to use Git Large File Storage (LFS), because all developers will have to install this (making it harder for new developers to start). Take a look in toolsForInstallation\Music.bat how to download large files using wget.exe during installation.
* Pull updates from the master branch frequently to reduce the risk of version conflicts.

## File structure and installation scripts
* The installation uses BAT files. It is horrible BUT it has the advantages that nobody has to install additional tools, it is understandable, and trasparent (can be read and editied with a text editor). Learn a few basics about batch programming: https://en.wikibooks.org/wiki/Windows_Batch_Scripting
* Read the installation scripts (.bat files) carefully to understand what is happening. Read also .gitignore, and xcopy_exclude.txt
* Read SAxVCxLC_source\Readme.txt

## Updating files during development
* The script copyOnlyNewerFiles.bat uses InstallSettings.bat to update only modified files. This means you can place files in the source directories and run the script. However, the file timestamp uses minutes not seconds. If you update files more frequently then a minute, then IMG files will not be recreated.
* When you make changes then eventually you will have to update the installation scripts in toolsForInstallation.
* Do not forget to add files to git and push them to your git branch.

# Troubleshooting, Errors, FAQs
## Problems after clean installation
SAxVCxLC must be installed on a clean game (HOODLUM 1.0)! After installing SAxVCxLC, test it BEFORE adding mods.
* *Error 0x5380C3 trying to load object instance with undefined ID* When using ModLoader.
See here: http://gtaforums.com/topic/813938-saxvcxlc-vc-and-lc-in-san-andreas/?p=1068034069
And here: http://gtaforums.com/topic/813938-saxvcxlc-vc-and-lc-in-san-andreas/?p=1069668668
* FastmanLimitAdjuster92.log says "Error, model hash 0x81AC51E7 is declared on multiple IDs: 384, 385, 386, 387, 388, 389, 390, 391, 392, 393,". SAxVCxLC contains a fix for that, this means that your the installation did not work completely. See also: http://gtaforums.com/topic/733982-fastman92-limit-adjuster/page-76#entry1069287124
* Fastman92LimitAdjuster.log says "Error 0x4087EA, file with undefined ID requested:" and "Last file to be loaded: data\shopping.dat". See: fastman92limitAdjuster_GTASA.ini, section [MAP LIMITS], item "Paths map size".

## Problems with savegames or original missions 
* About savegames. Mods can introduce faults into savegames that show up later in the future. Once a savegame has a fault, that fault will copy from savegame to savegame like a virus. This problem has nothing to do with SAxVCxLC. Once a savegame has a problem it must be deleted as well as all derived savegames. 
After completing a missing using "All Mission Access Mod v1.2" I think it is not safe to create savegame from that state.
For example see here: http://gtaforums.com/topic/813938-saxvcxlc-vc-and-lc-in-san-andreas/?p=1069680402
* Missions that sometimes work and sometimes not: ("OG LOC", "Saint Mark's Bistro")
* Missions that have been tested successfully: 

## Problems with external mods
Incompatible with FLA (SAxVCxLC is based on FastmanLimitAdjuster92 (FLA)):
* Dkpacc22 Hud
* A list with mods that are incompatible due to FLA exist also in another similar project: http://gtaforums.com/topic/883865-gta-underground-compatible-modifications-thread/

# Mods for SAxVCxLC (specifically adjusted)
SAxVCxLC is compatible with most mods for normal SA. Below is a list of mods that are specially adjusted or created for SAxVCxLC.
* Project Props (http://gtaforums.com/topic/885393-project-props/)

