# CPU Support package for the M4xx from Nuvoton

This CPU Support package enables the development for the M4xx Micro Controller family using the [Crossworks development environment](https://www.rowley.co.uk/arm/index.htm) from Rowley. The package provides all needed data and information to enabled the Development Environment to compile and debug applications on the M4xx Microprocessor
This Includes:

- CMSIS-Specific Code Files
- Memory-Map-Files
- Register-Descriptions for debugging
- Loader for programming the application to the Flash-memory

[Markus Klein](https://github.com/Masmiseim36) is helping with the development of this package.

## Build and Install

The Package is provided unpacked and has to be packed before it can be installed. For this open the Project File located in the root of the project with the Crossworks IDE (File Nuvoton_M43x.hzp). Then “compile" it like a normal project (Build -> Build M4xx). This will create the CPU-Support package in the root-Folder of the project (-> Nuvoton_M43x.hzq).
To install the new created package, go to Tools -> Packages -> Manually Install Packages and choose the new File.  
![Package Manager](./doc/Menu_PackageManagerManual.png)


[This document was copied and modified from Markus Klein's article.](https://github.com/Masmiseim36/Kinetis)
