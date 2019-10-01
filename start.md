# Getting started

## Splinefit
If you haven't done so already, make sure to download and install the
[splinefit](https://github.com/ooreilly/splinefit) package. A simple test to see
that it is installed is to run one of its command line tools. For example, try
to run
```bash
$ tsurfmesh
```
If this command cannot be found, then the command line tools for *splinefit* has
not been installed. Next, check if the package itself has been installed by
```bash
$ python3
$ import splinefit
```
Unless python throws a `ModuleNotFoundError`, you should be good to go.

### Manually installing the command line tools
If necessary, it should be possible to manually add the
command line tools to the `PATH` environment variable. These tools can be found
in `splinefit/bin/`. If your shell is bash, edit your `~/.bashrc` by appending
the path to the `bin` directory of *splinefit*. For example,
`bash
$ 
echo "PATH=$PATH:~/codes/splinefit/splinefit/bin; export PATH" >> ~/.bashrc
`


## Gmsh
All of the examples and tutorials use [gmsh](http://gmsh.info) to mesh the
geometries. Please download the software and follow the instructions to install
it. If you already have gmsh installed, please make sure that it is up to date.

It is important that gmsh can be launched from a terminal window.
Try typing `gmsh` into a terminal window to see if the application opens. If
not, you need to make sure that it is in on your path.

For OS X, please see these instructions to add gmsh to your path
[#482](https://gitlab.onelab.info/gmsh/gmsh/issues/482).

### Default configuration
If you already have gmsh installed from before, chances are that you have
modified the default settings. If you fail to reproduce any of the meshes shown
in this repository, it could be due to using non-default settings. To restore
the default configuration for gmsh, go to `Tools -> Options -> General ->
Advanced` and click on `Restore All Options to Default Settings`.

## Paraview

Some of the tutorials and examples use [Paraview](https://www.paraview.org/) for
rendering images and visual inspection. Installing Paraview is optional, but
recommended.
