ThisBuild / version := "0.1.0-SNAPSHOT"

ThisBuild / scalaVersion := "2.11.12"

libraryDependencies += "edu.berkeley.cs" %% "chisel3" % "3.2.8"
libraryDependencies += "edu.berkeley.cs" %% "chisel-iotesters" % "1.3.8"

lazy val root = (project in file("."))
  .settings(
    name := "CPU"
  )
