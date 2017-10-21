libraryDependencies += "com.lihaoyi" % "ammonite" % "1.0.2" % "test" cross CrossVersion.full
initialCommands in (Test, console) := """ammonite.Main().run()"""
