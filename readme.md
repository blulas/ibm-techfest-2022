# IBM Business Automation - Decision Manager Open Edition - Kogito Demo

This repository contains the master Maven parent project object model (POM) for all demos related to IBM Decision Manzger Open Edition.

## Overview

The purpose of the demo parent POM is to provide a single Maven project that manages the group of dependencies for all Decison Manager Open Edition projects.  The demo parent POM is divided into several sections, listed as follows:

### Properties Section

In a Maven pom file you have the ability to manage properties used throughout the build process.  Properties are inherited at the pom level, so any pom that uses a pom as a `parent` will inherit these property values.  

``` xml
	<!-- Project Properties -->
	<properties>
		<!-- General Properties -->
		<project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
		<project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>

		<!-- Java Properties -->
		<java.version>11</java.version>

		<!-- Common Maven Plugins -->
		<maven.compiler.source>${java.version}</maven.compiler.source>
		<maven.compiler.target>${java.version}</maven.compiler.target>
		<maven.compiler.plugin.version>3.8.1</maven.compiler.plugin.version>
		<maven.compiler.parameters>true</maven.compiler.parameters>
		<maven.resources.plugin.version>3.2.0</maven.resources.plugin.version>
		<maven.shade.plugin.version>3.2.4</maven.shade.plugin.version>
		<maven.surefire.plugin.version>3.0.0-M5</maven.surefire.plugin.version>

		<!-- Quarkus Dependencies -->
		<quarkus.group.id>io.quarkus.platform</quarkus.group.id>
		<quarkus.artifact.id>quarkus-bom</quarkus.artifact.id>
		<quarkus.version>2.7.3.Final</quarkus.version>

		<!-- Kogito Dependencies -->
		<kogito.group.id>org.kie.kogito</kogito.group.id>
		<kogito.artifact.id>kogito-quarkus-bom</kogito.artifact.id>
		<kogito.version>1.18.0.Final</kogito.version>

		<!-- Testing Properties -->
		<junit.version>4.13.2</junit.version>
		<skipTests>true</skipTests>

		<!-- Logging Dependencies -->
		<slf4j.version>1.7.32</slf4j.version>
		<logback.version>1.2.10</logback.version>
	</properties>
```

### Distribution Management Section

This section allows the user to configure where built artifacts are delivered to.  In Maven, there are two types of build targets, `install` and `deploy`.  The `install` target deliveres the resulting built packages to the user's local `.m2/repository` location, configured by the user's `settings.xml` file, located either in the user's `.m2` location or in the `/conf` folder of the Maven installation directory.  The `deploy` target uses the location specified in the `distributionManagement` section to deliver the resulting packages into the enterprise Maven (Artifactory) repository.

``` xml
	<!-- Enterprise Artifact Repository -->
	<distributionManagement>
		<repository>
			<id>${repository.id}</id>
			<name>${repository.name}</name>
			<url>${repository.url}</url>
		</repository>
	</distributionManagement>
```

Then on the server side add the following code gist to the `settings.xml` file wherever your enterprise repository is configured:

``` xml
	<servers>
		<server>
			<id>${repository.id}</id>
			<username>${user}</username>
			<password>${password}</password>
		</server>
	</servers>
```

Notice how the **id** tag in the **server** config in `settings.xml` lines up the **id** tag in the **repository** config of the `pom.xml` file!

## How To Build

This repository is built using `mvn clean install` by either the CI/CD pipeline or on a local developer workstation.  

## How To Deploy

This repository is built using `mvn clean deploy` by either the CI/CD pipeline or on a local developer workstation.  As the master POM for all demo projects, this repository must be the first repository built and deployed to enterprise Maven (Artifactory).

## Additional Information (*Appendicies*)
This repository is focused on business automation using **IBM Decison Manager Open Edition** products, which in turn rely on various open source tools and technology. The following online documentation is available in order to learn various aspects of these tools:

- [**Apache Maven**](https://maven.apache.org/) is a free and open source software project management and comprehension tool. Based on
  the concept of a project object model (POM), Maven can manage a project’s build, reporting and documentation from a central piece of
  information. A **getting started guide** is available [here](http://maven.apache.org/guides/getting-started/).
- [**Git**](https://git-scm.com//) is a free and open source distributed version control system designed to handle everything
  from small to very large projects with speed and efficiency. There is a **handbook** available [here](https://guides.github.com/introduction/git-handbook/), as well as various **guides** for learning and working with Git available [here](https://guides.github.com/