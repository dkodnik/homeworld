#!/bin/sh
# Prepares Relic's Homeworld source code release for diff'ing against the
# Homeworld SDL source.
#
# Note that this doesn't remove the unused files from the original Homeworld
# source but merely moves files around such that we get a useful patch to
# update the original source with the changes in Homeworld SDL.

echo "Preparing Homeworld source for patching to Homeworld SDL..."

# Quick test to see if we're not in the Homeworld source directory.
if ! [ -d src/Game ]
then
	echo
	echo "It does not appear that we are running from the bottom level directory of the"
	echo "Homeworld source code tree.  Make sure the script is being run from the main"
	echo "directory of the source tree.  If we are currently in the bottom level"
	echo "directory of the source code, make sure you are using a fresh copy of the"
	echo "original Homeworld source code from the Relic Developers Network"
	echo "(http://www.relic.com/rdn/)."

	exit 1
fi

# Quick test to see if this has possibly already been run.
if [ -f src/SDL/main.c ]
then
	echo
	echo "It appears the source tree has already been modified for patching.  If this"
	echo "script has not yet been run on the source tree, make sure you are using a"
	echo "fresh copy of the original Homeworld source code from the Relic Developers"
	echo "Network (http://www.relic.com/rdn/)."

	exit 1
fi

# Move contents src/Win32 to src/SDL.
mv src/Win32/* src/SDL
rm -f src/SDL/MAKEFILE src/SDL/MAKEFILE.NoDebugInfo

# We need the msg/ServerStatus.h header from the Titan includes to build the
# game.
cp src/Titan/msg/ServerStatus.h include/Titan/msg/ServerStatus.h

# Adjust capitalization of various source files in src/Game, move
# KNITransform.cpp to KNITransform.c, and rename .c files which don't get
# compiled.
cd src/Game
mv AIMoves1.c AIMoves1.c.h
mv AIMoves2.c AIMoves2.c.h
mv AIOrders2.c AIOrders2.c.h
mv AItrack.c AITrack.c
mv AItrack.h AITrack.h
mv animatic.c Animatic.c
mv animatic.h Animatic.h
mv attack.c Attack.c
mv attack.h Attack.h
mv autodownloadmap.c AutoDownloadMap.c
mv autodownloadmap.h AutoDownloadMap.h
mv autolod.c AutoLOD.c
mv autolod.h AutoLOD.h
mv battle.c Battle.c
mv battle.h Battle.h
mv bigfile.c BigFile.c
mv bigfile.h BigFile.h
mv blobs.c Blobs.c
mv blobs.h Blobs.h
mv bmp.c BMP.c
mv bmp.h BMP.h
mv bounties.c Bounties.c
mv bounties.h Bounties.h
mv b-spline.c B-Spline.c
mv b-spline.h B-Spline.h
mv btg.c BTG.c
mv btg.h BTG.h
mv camera.c Camera.c
mv camera.h Camera.h
mv chatting.c Chatting.c
mv chatting.h Chatting.h
mv clamp.c Clamp.c
mv clamp.h Clamp.h
mv clipper.c Clipper.c
mv clipper.h Clipper.h
mv clouds.c Clouds.c
mv clouds.h Clouds.h
mv collision.c Collision.c
mv collision.h Collision.h
mv colpick.c ColPick.c
mv colpick.h ColPick.h
mv consMgr.c ConsMgr.c
mv consMgr.h ConsMgr.h
mv crates.c Crates.c
mv crates.h Crates.h
mv crc32.c CRC32.c
mv crc32.h CRC32.h
mv damage.c Damage.c
mv damage.h Damage.h
mv demo.c Demo.c
mv demo.h Demo.h
mv dock.c Dock.c
mv dock.h Dock.h
mv etg.c ETG.c
mv etg.h ETG.h
mv eval.c Eval.c
mv eval.h Eval.h
mv fastmath.c FastMath.c
mv fastmath.h FastMath.h
mv FeFlow.c FEFlow.c
mv FeFlow.h FEFlow.h
mv FeReg.c FEReg.c
mv FeReg.h FEReg.h
mv file.c File.c
mv file.h File.h
mv flightman.c FlightMan.c
mv flightman.h FlightMan.h
mv fontreg.c FontReg.c
mv fontreg.h FontReg.h
mv formation.c Formation.c
mv formation.h Formation.h
mv gamepick.c GamePick.c
mv gamepick.h GamePick.h
mv gamestats.h GameStats.h
mv gun.c Gun.c
mv gun.h Gun.h
mv hash.c Hash.c
mv hash.h Hash.h
mv hs.c HS.c
mv hs.h HS.h
mv key.c Key.c
mv KEY.H Key.h
mv knitransform.cpp KNITransform.c
mv launchMgr.c LaunchMgr.c
mv launchMgr.h LaunchMgr.h
mv levelload.c LevelLoad.c
mv levelload.h LevelLoad.h
mv liloptions.h LilOptions.h
mv linkedlist.c LinkedList.c
mv linkedlist.h LinkedList.h
mv LZSS.C LZSS.c
mv madLinkIn.c MadLinkIn.c
mv madLinkInDefs.h MadLinkInDefs.h
mv madLinkIn.h MadLinkIn.h
mv matrix.c Matrix.c
mv matrix.h Matrix.h
mv memory.c Memory.c
mv memory.h Memory.h
mv meshanim.c MeshAnim.c
mv meshanim.h MeshAnim.h
mv mesh.c Mesh.c
mv mesh.h Mesh.h
mv mex.c MEX.c
mv mex.h MEX.h
mv navlights.c NavLights.c
mv navlights.h NavLights.h
mv nebulae.c Nebulae.c
mv nebulae.h Nebulae.h
mv netcheck.c NetCheck.c
mv netcheck.h NetCheck.h
mv nis.c NIS.c
mv nis.h NIS.h
mv objtypes.c ObjTypes.c
mv objtypes.h ObjTypes.h
mv options.c Options.c
mv options.h Options.h
mv particle.c Particle.c
mv particle.h Particle.h
mv physics.c Physics.c
mv physics.h Physics.h
mv pieplate.c PiePlate.c
mv pieplate.h PiePlate.h
mv ping.c Ping.c
mv ping.h Ping.h
mv randy.c Randy.c
mv randy.h Randy.h
mv region.c Region.c
mv region.h Region.h
mv rescollect.c ResCollect.c
mv rescollect.h ResCollect.h
mv researchapi.c ResearchAPI.c
mv researchapi.h ResearchAPI.h
mv researchgui.c ResearchGUI.c
mv researchgui.h ResearchGUI.h
mv scenpick.c ScenPick.c
mv scenpick.h ScenPick.h
mv scroller.c Scroller.c
mv scroller.h Scroller.h
mv select.c Select.c
mv select.h Select.h
mv sensors.c Sensors.c
mv sensors.h Sensors.h
mv shader.c Shader.c
mv shader.h Shader.h
mv shipselect.c ShipSelect.c
mv shipselect.h ShipSelect.h
mv ships.h Ships.h
mv shipview.c ShipView.c
mv shipview.h ShipView.h
mv singleplayer.c SinglePlayer.c
mv singleplayer.h SinglePlayer.h
mv soundevent.c SoundEvent.c
mv soundeventdefs.h SoundEventDefs.h
mv soundevent.h SoundEvent.h
mv soundeventplay.c SoundEventPlay.c
mv soundmusic.h SoundMusic.h
mv soundstructs.h SoundStructs.h
mv spaceobj.h SpaceObj.h
mv speechevent.c SpeechEvent.c
mv speechevent.h SpeechEvent.h
mv star3d.c Star3d.c
mv star3d.h Star3d.h
mv stats.c Stats.c
mv statscript.c StatScript.c
mv statscript.h StatScript.h
mv stats.h Stats.h
mv switches.h Switches.h
mv tactical.c Tactical.c
mv tactical.h Tactical.h
mv tactics.c Tactics.c
mv tactics.h Tactics.h
mv taskbar.c TaskBar.c
mv taskbar.h TaskBar.h
mv task.c Task.c
mv task.h Task.h
mv teams.c Teams.c
mv teams.h Teams.h
mv titannet.c TitanNet.c
mv titannet.h TitanNet.h
mv tracking.c Tracking.c
mv tracking.h Tracking.h
mv transformer.c Transformer.c
mv transformer.h Transformer.h
mv tutorial.c Tutorial.c
mv tutorial.h Tutorial.h
mv tweak.c Tweak.c
mv tweak.h Tweak.h
mv twiddle.c Twiddle.c
mv twiddle.h Twiddle.h
mv TYPES.H Types.h
mv UIcontrols.c UIControls.c
mv UIcontrols.h UIControls.h
mv undo.c Undo.c
mv undo.h Undo.h
mv universe.c Universe.c
mv universe.h Universe.h
mv univupdate.c UnivUpdate.c
mv univupdate.h UnivUpdate.h
mv vector.c Vector.c
mv vector.h Vector.h
cd ../..

# Rename src/JPG source files to lowercase.
cd src/JPG
mv INTERFCE.c interfce.c
mv INTERFCE.H interfce.h
mv JCAPIMIN.c jcapimin.c
mv JCAPISTD.c jcapistd.c
mv JCCOEFCT.c jccoefct.c
mv JCCOLOR.c jccolor.c
mv JCDCTMGR.c jcdctmgr.c
mv JCHUFF.c jchuff.c
mv JCHUFF.H jchuff.h
mv JCINIT.c jcinit.c
mv JCMAINCT.c jcmainct.c
mv JCMARKER.c jcmarker.c
mv JCMASTER.c jcmaster.c
mv JCOMAPI.c jcomapi.c
mv JCONFIG.H jconfig.h
mv JCPARAM.c jcparam.c
mv JCPHUFF.c jcphuff.c
mv JCPREPCT.c jcprepct.c
mv JCSAMPLE.c jcsample.c
mv JCTRANS.c jctrans.c
mv JDAPIMIN.c jdapimin.c
mv JDAPISTD.c jdapistd.c
mv JDATADST.c jdatadst.c
mv JDATASRC.c jdatasrc.c
mv JDCOEFCT.c jdcoefct.c
mv JDCOLOR.c jdcolor.c
mv JDCT.H jdct.h
mv JDDCTMGR.c jddctmgr.c
mv JDHUFF.c jdhuff.c
mv JDHUFF.H jdhuff.h
mv JDINPUT.c jdinput.c
mv JDMAINCT.c jdmainct.c
mv JDMARKER.c jdmarker.c
mv JDMASTER.c jdmaster.c
mv JDMERGE.c jdmerge.c
mv JDPHUFF.c jdphuff.c
mv JDPOSTCT.c jdpostct.c
mv JDSAMPLE.c jdsample.c
mv JDTRANS.c jdtrans.c
mv JERROR.c jerror.c
mv JERROR.H jerror.h
mv JFDCTFLT.c jfdctflt.c
mv JFDCTFST.c jfdctfst.c
mv JFDCTINT.c jfdctint.c
mv JIDCTFLT.c jidctflt.c
mv JIDCTFST.c jidctfst.c
mv JIDCTINT.c jidctint.c
mv JIDCTRED.c jidctred.c
mv JINCLUDE.H jinclude.h
mv JMEMMGR.c jmemmgr.c
mv JMEMNOBS.c jmemnobs.c
mv JMEMSYS.H jmemsys.h
mv JMORECFG.H jmorecfg.h
mv JPEGINT.H jpegint.h
mv JPEGLIB.H jpeglib.h
mv JPEGRC.H jpegrc.h
mv JQUANT1.c jquant1.c
mv JQUANT2.c jquant2.c
mv JUTILS.c jutils.c
mv JVERSION.H jversion.h
cd ../..

# Rename stipple.c to stipple.c.h in src/rgl since it doesn't actually get
# compiled, get rid of "makefile" to keep from confusing make.
cd src/rgl
mv stipple.c stipple.c.h
rm -f makefile
cd ../..

# Move more C++ sources to C sources under src/SDL, copy smixer.c, soundlow.c,
# and sstream.c for useless work-in-progress versions.
cd src/SDL
mv avi.cpp avi.c
mv rinit.cpp rinit.c
cp smixer.c smixer.c.wip
cp soundlow.c soundlow.c.wip
cp sstream.c sstream.c.wip
cd ../..

# Prepare kas2c build directory.
# Bison doesn't seem to like DOS EOL...didn't bother to find out about Flex,
# but since I'm here I'll change it anyway.
cp tools/win32/KAS/KAS2C.c src/kas2c/kas2c.c
cp tools/win32/KAS/KAS2C.h src/kas2c/kas2c.h
cat tools/win32/KAS/KAS2C.l | sed -e 's/\r$//g' > src/kas2c/lexer.l
cat tools/win32/KAS/KAS2C.y | sed -e 's/\r$//g' > src/kas2c/parser.y

echo "The Homeworld source code is now ready for patching.  You can patch the source"
echo "to the Homeworld SDL source by running something like the following:"
echo "    cat homeworld_sdl-orig-to-x.xx.patch | patch -p1"
echo "from the current directory (where \"homeworld_sdl-orig-to-x.xx.patch\" is the"
echo "name of the Homeworld SDL patch, i.e. \"homeworld_sdl-orig-to-0.3.patch\")."
