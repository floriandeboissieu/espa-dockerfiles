# ESPA Docker Image Generation

<b>This is very much a WORK IN PROGRESS.  Not currently used for anything other than development by some members of the team.</b>

### System Dependencies
At this point in time, the dependencies listed here, do not reflect the versions currently used in production.  <b>AND AS SUCH HAVE NOT BEEN THROUGH VALIDATION and may be reverted back to older versions</b>.  Production is using older versions for nearly all dependencies.<br>

The "Required" column indicates the dependency is utilized by the processing system.  Otherwise it is probably only used by our auxiliary retrieval and generation tools and not currently added to any of the Docker images.  Also a "yes" only indicates used by one or more applications.

#### System Provided External Libraries and Applications
These dependencies are installed through the Linux distro.  Current development is utilizing Centos 7.

| Dependency | Version  | Source                                                          | Required | Information |
| ---------- | -------- | --------------------------------------------------------------- | -------- | ----------- |
| wgrib      | 1.8.1.2c | Centos 7                                                        | Yes      | |
| TODO       |          | Centos 7                                                        | Yes      | I'm sure more should be listed here |
| TODO       |          | Centos 7                                                        | Yes      | |
| TODO       |          | Centos 7                                                        | Yes      | |
| TODO       |          | Centos 7                                                        | Yes      | |

#### Other External Libraries and Applications
These libraries and applications are built and installed into the system from source code.

| Dependency | Version  | Source                                                          | Required | Information |
| ---------- | -------- | --------------------------------------------------------------- | -------- | ----------- |
| curl       | 7.48.0   | http://curl.haxx.se/download.html                               | No       | Used by auxiliary generation software |
| idn        | 1.32     | ftp://ftp.gnu.org/gnu/libidn/                                   | No       | Used by auxiliary generation software |
| jbigkit    | 2.1      | http://www.cl.cam.ac.uk/~mgk25/jbigkit/                         | Yes      | Add -fPIC -DPIC to the CFLAGS in the top-level Makefile |
| jpeg       | 9b       | http://www.ijg.org/files/                                       | Yes      | |
| libxml2    | 2.9.3    | ftp://xmlsoft.org/libxml2/                                      | Yes      | |
| libxslt    | 1.1.28   | ftp://xmlsoft.org/libxslt/                                      | Yes      | Required for python lxml module |
| szip       | 2.1      | https://www.hdfgroup.org/doc_resource/SZIP/                     | Yes      | |
| tiff       | 4.0.6    | http://download.osgeo.org/libtiff/                              | Yes      | |
| libgeotiff | 1.4.1    | http://download.osgeo.org/geotiff/libgeotiff/                   | Yes      | |
| libpng     | 1.6.21   | http://sourceforge.net/projects/libpng/files/libpng16/          | Yes      | Required for python matplotlib module |
| xz/lzma    | 5.2.2    | http://tukaani.org/xz/                                          | Yes      | |
| zlib       | 1.2.8    | http://www.zlib.net/                                            | Yes      | |
| hdf4       | 4.2.11   | https://www.hdfgroup.org/downloads/index.html                   | Yes      | |
| hdf5       | 1.8.16   | https://www.hdfgroup.org/downloads/index.html                   | Yes      | |
| netcdf-4   | 4.4.0    | http://www.unidata.ucar.edu/software/netcdf/                    | Yes      | |
| hdfeos2    | 2.19     | ftp://edhs1.gsfc.nasa.gov/edhs/hdfeos/latest_release/           | Yes      | |
| freetype2  | 2.6.3    | http://sourceforge.net/projects/freetype/files/freetype2/       | Yes      | Required for python matplotlib module |
| proj4      | 4.9.1    | https://trac.osgeo.org/proj/                                    | Yes      | GDAL needs this |
| gdal       | 1.11.4   | http://download.osgeo.org/gdal ftp://ftp.remotesensing.org/gdal | Yes      | |
| MODTRAN    | 5.3.2    |                                                                 | Yes      | |

### Building the Images
Each build command will build any required inherited images.

#### Retireving External Libraries and Applications Source Code
A script is provided, with some validation for corruption, to download each of the required items.

```
$ cd external_tools
$ ./retrieve-external-tools.sh
```

##### jbigkit Requires Makefile Modification
To properly build jbigkit with the rest of the libraries and applications, a modification to the top-level makefile is required.  Please replace the top-level Makefile with <b>jbigkit-2.1-Makefile</b>.  This will properly set compiling options.

#### CentOS Versions (Working On and Used By Some Developers)
  - Image <b>usgs.espa.centos.base</b><br>```$ make centos.base```
  - Image <b>usgs.espa.centos.external</b><br>```$ make centos.external```
  - Image <b>usgs.espa.centos.science</b><br>```$ make centos.science```
  - Image <b>usgs.espa.centos.modtran</b><br>```$ make centos.modtran```<br>
Only used by a prototype science application and you would need to obtain your own version of MODTRAN.

### Running Science Applications
In the future more enhancements will be made to make running science applications easier.  At this point in time it is very manual as it is only used by some developers.

#### Starting a <b>usgs.espa.centos.science</b> Docker Container

##### Simplified Running of the Science Container
I'll leave the mounting of disk paths for input and output as an exercise for the user.  <b>Note:</b> The science image could use a better command line prompt.

```
$ docker run --rm --tty --interactive usgs.espa.centos.science `id -g` `id -u` /bin/bash
```

### General Docker Notes

#### Mounting A Volume
- We prefer mounting a volume from the command line since it is more configurable, and you don't have to rebuild an image when you want to change the mount.
  - See System Time example below.
  - You can mount files as well as directories using the --volume command.
  - Requires the host to have that directory or file present.
- You should consider applying the mode attribute to the volume being mounted.
  - By default volumes are mounted read-write (:rw)
  - If you want to mount read-only specify (:ro)
  - See example in System Time below.
- <b>Warning:</b> When specifying a volume, <b>if it does not exist on the host</b>, it will be created (assuming you have privileges).
  - Learned that the hard way......

#### System Time
By default the time on the system is UTC.  If you wish to change that to the time specified on the host system, you simply have to mount /etc/localtime from the host.
- --volume /etc/localtime:/etc/localtime:ro
