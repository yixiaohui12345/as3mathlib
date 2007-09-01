This is the com.wis namespace for Flash MX 2004 AS2.0 class packages.

If you haven't yet set-up a classpath for housing external class packages, 
do so by saving this entire directory to a handy location of your choosing.

Then follow these instructions:

Note that some classes will be dependent upon other classes both within and/or
across packages. Each of the class headers will inform you if a dependency exists.
It's important to keep the classpath intact for continuity between classes, so if
you download individual classes or packages, make sure that each class is located
in it's appropriately named package folder, and each package is located within the
'wis' namespace folder you create in your classpath. FMX 2004 is case-sensitive, so
be sure to use the same syntax that I am using in the full namespace download. I
am including the full namespace directories in the package downloads; if you are
downloading an individual package the classpath will be correct. If you have already
placed the namespace in your classpath and you are updating it with individual classes
or packages, make sure you adhere to the namespace heirarchy.

[classpath] \com\wis\..(level 3-5)..packageName\ClassName.as

To set a global classpath, click Edit/Preferences/ActionScript/ActionScript2.0 Settings,
then add a new path by clicking the '+' and entering the absolute path to a new directory
located wherever you choose to place it, then move the new classpath to the top of
the list, ahead of the default path. This same directory can also be used to house
any built-in classes that you have modified, leaving the original copy undisturbed.


**************************************************************************

November 10, 2003: the com.wis directory presently houses this structure:
March 15, 2004 - update
June 26, 2004 - update to v1.4 for all class files
July 17, 2004 - update to v1.6 for all class files
January 11, 2005 - update to v1.7 for some class files
July 8, 2005 - updated to v1.8 for some class files and zips

default folder    ... MCE.as                       v1.6        zipped bundles hold file within com folder - should be placed in default folder

com.wis.math.alg. ...

                      Bitwise.as                   v1.6        zip
                      Complex.as                   v1.6        zip
                      Decomposition.as             v1.7
                      Eval.as                      v1.6
                      Logic.as                     --
                      Matrix.as                    v1.6        zip
                      Point.as                     v1.6        zip
                      Polynomial.as                v1.6        zip
                      Quaternion.as                v1.6
                      Regression.as                v1.6
                      Vector.as                    v1.6        zip

com.wis.math.calc. ...

                      Derivative.as                v1.8        zip
                      Fourier.as                   v1.7
                      FunctionRate.as              v1.7
                      Integral.as                  v1.7        zip  
                      IODE.as                      v1.7
                      IODESolver.as                v1.7 

com.wis.math.calc.solvers. ... 

                      Euler.as                     v1.7
                      EulerRichardson.as           v1.7
                      RK4.as                       v1.7
                      RK45.as                      v1.7
                      RK45MultiStep                v1.7
                      VelocityVerlet.as            v1.7
                      Verlet.as                    v1.7                  

com.wis.math.geom.curve. ...

                      BezCubic.as                  --
                      BezQuad.as                   v1.6        zip
                      BSpline.as                   --
                      Catmull_Rom.as               --
                      Nurb.as                      --                     

com.wis.math.geom.intersect2d. ...

                      Intersect2d.as               v1.6
                      Intersect2dBez2.as           v1.6
                      Intersect2dBez3.as           v1.6
                      Intersect2dBez3Bez3.as       v1.6
                      Intersect2dCircle.as         v1.6
                      Intersect2dLine.as           v1.6
                      Intersect2dParams.as         v1.6
                      
com.wis.math.geom.intersect3d. ...

                      Intersect3d.as               v1.6
                      Intersect3dRay.as            v1.8
                      Union.as                     v1.6 

com.wis.math.geom.polytope. ...

                      Box.as                       v1.6
                      Plane.as                     v1.6
                      Platonic.as                  --
                      Polygon.as                   --
                      Pyramid.as                   --
                      Rectangle.as                 --
                      Triangle.as                  --                     

com.wis.math.geom.quadric. ...

                      Circle.as                    --
                      Cone.as                      v1.6
                      Cylinder.as                  v1.6
                      Ellipse.as                   --
                      Ellipsoid.as                 --
                      Hyperbola.as                 -- 
                      Sphere.as                    v1.6                      

com.wis.math.geom.trig. ...

                      Circular.as                  v1.6        zip
                      Degree.as                    v1.6        zip
                      Hyperbolic.as                v1.6        zip
                      
com.wis.math.geom.util. ...

                      Camera.as                    v1.6
                      Finish.as                    v1.6
                      Graphic.as                   v1.8        zip 
                      Intersection.as              v1.6 
                      LightSource.as               v1.6
                      Noise.as                     v1.6        zip
                      Ray.as                       v1.6
                      RegPoint.as                  v1.6        zip
                      Texture.as                   v1.6
                      Transformation.as            v1.6                    

com.wis.math.num. ...

                      Constant.as                  v1.6        zip
                      Factor.as                    v1.6        zip
                      Format.as                    v1.6        zip
                      Stat.as                      v1.6        zip
                      
com.wis.types. ...        
 
                      Arr.as                       v1.6        zip
                      Col.as                       v1.6        zip
                      ColMC.as                     v1.6        zip
                      Obj.as                       v1.6
                      IObj.as                      v1.6

com.wis.types.lists ... 

                      BinaryTree.as                v1.6        zip
                      Dictionary.as                v1.6        zip
                      DoubleLink.as                --
                      Node.as                      v1.6
                      SingleLink.as                --
                     
**************************************************************************

Updates and more information are available here:

http://members.shaw.ca/flashprogramming/wisASLibrary/wis/

**************************************************************************
