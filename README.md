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

## Co-Authors/Direct Contributors:
* goodidea82 - Infrastructure, Installation
* inan.ahammad - Added garages in VC/LC, testing/bug reporting
* HeicoDE - Bugfixes, script updates
* eagle152 - zone/gang fixes
* chaosbginwenrealityend - Culling fixes
* artginPL - ENEX/Interior Markers, Patches, Conversion of music for radio
* Swoorup - PathMover, COLRenamer(old program :p), Conversion of LC and VC paths

## Credits/Special Thanks:
Providing help and additional ressources
* fastman92 - [Limit Adjuster](https://gtaforums.com/topic/733982-fastman92-limit-adjuster/), [IMG Console](https://gtaforums.com/topic/524409-fastman92-img-console/), Debugging 
* GTA: Liberty City Team - Use of GTA:LC map
* [OpenVice](https://gtaforums.com/topic/423864-wip-openvice-another-vice-map-for-sa/?tab=comments#comment-1059461103)(NTAuthority) - Use of Vice City map
* Silent - [ASI Loader](https://gtaforums.com/topic/523982-relopensrc-silents-asi-loader/) and [Extended Gangs ASI](https://gtaforums.com/topic/682194-extended-gang-wars/?tab=comments#comment-1064701250)
* LINK2012 - [Modloader](https://gtaforums.com/topic/669520-mod-loader/), [Garage Extender](https://gtaforums.com/topic/536465-garage-extender/)
* _F_ - use of GTA VC cars Converted to SA
* CJ2000 - use of GTA VC and III vehicles
* Kam - [Kam's Max Scripts](https://gtaforums.com/topic/907323-rel-kams-gta-scripts-2018/)
* Deniska - 3dmax script pack
* x-men - 3dmax scripts/IMG Manager
* CLEO Team - [CLEO](https://gtaforums.com/topic/674029-sarel-cleo-43/?tab=comments#comment-1064503982)
* ThirteenAG - [Project2dfx](https://gtaforums.com/topic/573478-project2dfx/)
* Junior_Djjr - Overhaul of CLEO scripts
* ZAZ - some of his CLEO mods were crucial for debugging/getting around the map.
* X-Seti - original concept of combining GTA III era cities so he deserves a shout out :p
* Squad - testing/bug reporting, map fixes
* Crspy - modloader installation fix
* Beckerbrasil - testing/bug reporting
* ILOVEFOOTBALL95 - testing/bug reporting

Thanks Rock* Games

# Installation
1. Two different ways exist to download the project (Use only ONE of them):
  * (Easy, but small UPDATES require full download and installation) Download the project as a Zip file from https://github.com/goodidea82/SAxVCxLC/releases. Extract the Zip file.
  * (Recommended because UPDATES are simple and fast): 
    - Download and install the [GIT client](https://git-scm.com/download/win). 
    - Run "Git-Bash.exe" and enter "git clone https://github.com/goodidea82/SAxVCxLC" to download the project.
     When SAxVCxLC gets an update you just double-click on updateFromGitHub.bat. Some infos: [here](https://gtaforums.com/topic/813938-saxvcxlc-vc-and-lc-in-san-andreas/?do=findComment&comment=1070405348) and [github-git-cheat-sheet.pdf](https://services.github.com/on-demand/downloads/github-git-cheat-sheet.pdf)
  
2. Click on Install.bat and follow the instructions there. Eventually additional files (radio music) will be downloaded.

If the installation script closes without asking to press a button (enter), then something went wrong. In this case run the script from cmd.exe so that the commandline window does not close and you can see what were the last words the script said.

# Remarks for developers of SAxVCxLC
## Principles
SAxVCxLC is a clean base for modding. This means SAxVCxLC should be as close as possible to the original games and modification or additions shall be provided as external mods (except for few cases where every user agrees).

* Developing SAxVCxLC means to [fix bugs](https://github.com/goodidea82/SAxVCxLC/issues); add missing things; and improve compatibility, modularity, and flexibility. Ideally all missions from VC and LC should be ported one day. The look-and-feel of the games shall remain original with priority for SA. Additional Rockstar maps may be added. In particular, original SA game must remain fully playable and modable at all times (backwards compatible with older mods). Things to keep in mind, for example:
  * Do not add/removed/modify objects in the SA map area.
  * All object IDs that were free in original SA game must remain free after SAxVCxLC installation. Do not use IDs in the range 0-20000.
  * The number of weapons, peds, cars, objects, etc. should be fixed some day (when all original things are ported). This important so that modders that provide external mods will know what are the IDs of objects for which they can provide improved versions and what are the remaining free IDs for new objects.
* Additions, modification, HD-content, scripts, etc for SAxVCxLC are very welcome. They should be provided as external mods for three reasons: (1) to advertise SAxVCxLC to new users on other websites, (2) to not force modification/addition on users, but let them customize it individually, (3) to ensure that SAxVCxLC becomes a stable base for modding (known used/free IDs etc). Many GTA-specialized websites exists where you can publish mods. In your mod provide a Readme.txt with a link to a release version on this GitHub. Here we can provide a list of mods that link to SAxVCxLC on GitHub.
* It is also possible to create a spin-off project if publishing a mod for SAxVCxLC is not a suitable solution for some reason (e.g. a super modded version). This can be done by using "fork" to create a derived GitHub project without creating a pull-request back. This way the spin-off can benefit from updates made to SAxVCxLC and from campatibility with mods made for SAxVCxLC. The spin-off must prominently say somewhere that it is based on SAxVCxLC.

## GitHub
* Create your GitHub account, then practice Git and GitHub on a hello-world project first. From experience we require that you install GIT on your computer (For example: https://git-scm.com/download/win) and test it with your hello-world project. You must understand (git add, git commit, git push, git pull) so read a tutorial on the internet. Some quick info [github-git-cheat-sheet.pdf](https://services.github.com/on-demand/downloads/github-git-cheat-sheet.pdf)
* Git configuration on windows: 
   * line endings: Checkout as-is
   * commit as-is (we use windows line endings)
* Contact us on "http://gtaforums.com/topic/813938-saxvcxlc-vc-and-lc-in-san-andreas/" so you can be included as collaborator on on this GitHub project. You can then do updates and patches on SAxVCxLC. The "Principles" in the above section must be respected. Once you have access as a collaborator:
    1. Open Git Bash on your computer and Use "git clone https://github.com/goodidea82/SAxVCxLC.git"
    2. Create a new branch "git branch BRANCHNAME" and switch to this branch "git checkout BRANCHNAME". Make sure that the BRANCHNAME starts with your username as prefix, e.g. "MisterGTA_testBranch".
    3. Create commits 'git commit -a -m "Some description..." ' to your local branch and frequently do "git pull" and "git merge master" to add the latest updates to your local branch. Use "git push" to send commits in your branch on your local computer to GitHub.
    4. When your work is ready to be added to the master branch, then do a pull request so that your changes will be reviewed and can then be merged into the master branch. To do a pull request: you can either
        * https://help.github.com/articles/creating-a-pull-request/  , or
        * https://git-scm.com/docs/git-request-pull 
* Do not upload big files on GitHub. The purpuse of Git is to keep track of many small files. Maxium allowed project size on GitHub is 1000 GB. 
* Let's try not to use Git Large File Storage (LFS), because all developers will have to install this (making it harder for new developers to start). Take a look in toolsForInstallation\Music.bat how to download large files using wget.exe during installation.
* To move and rename files/folders install GIT on your computer rather than using the web interface.  Use "git mv" to move files and directories and "git rm" to delete files and so on.
* Pull updates "git pull" from the master branch frequently to reduce the risk of version conflicts.

## File structure and installation scripts
* The installation uses BAT files. It is horrible BUT it has the advantages that nobody has to install additional tools, it is  trasparent (people can read it and edit with a text editor). Learn a few basics about batch programming [here](https://en.wikibooks.org/wiki/Windows_Batch_Scripting)
* Read the installation scripts (.bat files) carefully to understand what is happening. Read also .gitignore, and xcopy_exclude.txt
* Read SAxVCxLC_source\Readme.txt

## Updating files during development
* The script copyOnlyNewerFiles.bat uses InstallSettings.bat to update only modified files. This means you can place files in the source directories and run the script. However, the file timestamp uses minutes not seconds. If you update files more frequently then a minute, then IMG files will not be recreated.
* When you make changes then eventually you will have to update the installation scripts in toolsForInstallation.
* Do not forget to add files to git and push them to your git branch.

# Troubleshooting, Errors, FAQs
Here is a list of [issues](https://github.com/goodidea82/SAxVCxLC/issues).
## Problems after clean installation
SAxVCxLC must be installed on a clean game (HOODLUM 1.0)! After installing SAxVCxLC, test it BEFORE adding mods.
* Game crashes. Try to remove the .asi files one-by-one (start with grgx.asi and ExGangWars.asi) and try to start the game again eachtime. However, do not remove fastman92limitAdjuster.asi because this one is essential. See [here](https://gtaforums.com/topic/813938-saxvcxlc-vc-and-lc-in-san-andreas/?do=findComment&comment=1070418105)
* Game freezes while loading: Perhaps a popup-window in the background (invisible) from Fastman92LimitAdjuster. Try pressing the Space-bar or Enter several times.
* Game started once, but not again: Perhaps gta_sa.exe did not close properly and is still running in the background and blocking the new start of gta. Open windows task manager and kill the process gta_sa.exe.
* *Error 0x5380C3 trying to load object instance with undefined ID* When using ModLoader.
See [here](http://gtaforums.com/topic/813938-saxvcxlc-vc-and-lc-in-san-andreas/?p=1068034069) and [here](http://gtaforums.com/topic/813938-saxvcxlc-vc-and-lc-in-san-andreas/?p=1069668668)
* FastmanLimitAdjuster92.log says "Error, model hash 0x81AC51E7 is declared on multiple IDs: 384, 385, 386, 387, 388, 389, 390, 391, 392, 393,". SAxVCxLC contains a fix for that, this means that your the installation did not work completely. See also [here](http://gtaforums.com/topic/733982-fastman92-limit-adjuster/page-76#entry1069287124)
* Fastman92LimitAdjuster.log says "Error 0x4087EA, file with undefined ID requested:" and "Last file to be loaded: data\shopping.dat". Try to adjust: fastman92limitAdjuster_GTASA.ini, section [MAP LIMITS], item "Paths map size".
* Error Status 0xc000012f “Bad Image” When Running a Program. This is a windows problem. See, for example [here]( https://www.winhelponline.com/blog/error-0xc000012f-bad-image-fix-corrupt-files/)
* Error 126: "missing dependency (DLL). Try using Dependency Walker on the ASI", see [here](https://gtaforums.com/topic/536465-garage-extender/?do=findComment&comment=1070397619)
* 0x00537D12 memory exception during game-play. See [here](https://gtaforums.com/topic/813938-saxvcxlc-vc-and-lc-in-san-andreas/?do=findComment&comment=1070421811)

## Problems with savegames or original missions 
* About savegames. Mods can introduce faults into savegames that show up later in the future. Once a savegame has a fault, that fault will copy from savegame to savegame like a virus. This problem has nothing to do with SAxVCxLC. Once a savegame has a problem it must be deleted as well as all derived savegames. 
After completing a missing using "All Mission Access Mod v1.2" I think it is not safe to create savegame from that state.
For example see [here](http://gtaforums.com/topic/813938-saxvcxlc-vc-and-lc-in-san-andreas/?p=1069680402)
* Missions that sometimes work and sometimes not: (["OG LOC"](https://github.com/goodidea82/SAxVCxLC/issues/26), ["Saint Mark's Bistro"](https://github.com/goodidea82/SAxVCxLC/issues/29), ["Nines & AKs", "Swet and Kendl"](https://github.com/goodidea82/SAxVCxLC/issues/28))
* Missions that have been tested successfully: 

## Problems with external mods
Incompatible with FLA (SAxVCxLC is based on FastmanLimitAdjuster92 (FLA)):
* Dkpacc22 Hud
* A list with mods that are incompatible due to FLA exist also in another similar project [here](http://gtaforums.com/topic/883865-gta-underground-compatible-modifications-thread/)
* GarageExtender grgx.asi doesn't seem to work properly with SilentPatch, eg. the Pay'n'Spray doesn't work. [See here](https://gtaforums.com/topic/536465-garage-extender/?do=findComment&comment=1070398545)

# Mods for SAxVCxLC (specifically adjusted)
SAxVCxLC is compatible with most mods for normal SA. Below is a list of mods that are specially adjusted or created for SAxVCxLC.
* Project Props (http://gtaforums.com/topic/885393-project-props/)


