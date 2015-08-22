Object-C adopting C++ static lib (.a)
===

In order to adopt the C++ lib in Object-C project, I adopt `git@github.com:ulwanski/md5.git` as the base project, which is a md5 project in C++. 

In this project, we are going to complete 2 tasks as following

* Compile a C++ static lib called `libmd5.a`
* Create an Object-C project using md5 static lib built above

The general idea is to expose the C interfaces which encapsulate the C++ static lib, since Object-C has no problem calling C functions directly.

##Purify C++ header to C header
###Move C++ relevated header to C++ source file

In original header file `md5.h`,
  ```
    #include <string>
    #include <cstring>
  ```
should be moved to file `md5.cpp`

###Refine C++ interfaces to C interfaces

In original header file `md5.h`,
  ```
    std::string md5(std::string dat);
    std::string md5(const void* dat, size_t len);
    std::string md5file(const char* filename);
    std::string md5file(std::FILE* file);
    std::string md5sum6(std::string dat);
    std::string md5sum6(const void* dat, size_t len);
  ```
should be changed into
  ```
    char* md5_C(char* dat);
    char* md5sum6_C(char* dat);
    char* md5file_C(const char* filename);
  ```
    Reasons are

    1.  There are actually only 3 functions necessary to be exposed, according to business logic.
    2.  The interfaces should be in C syntax.

###Extern C interfaces
In header file `md5.h`, it should declare that those interfaces should be linked as C functions. In this case, we braces the interfaces by

  ```
    #ifdef __cplusplus
    extern "C" {
    #endif
  ```
and
  ```
    #ifdef __cplusplus
    }
    #endif
  ```

##Add interface implementation in C++ source file
In our case, we need to add three more functions in `md5.cpp`, which are
  ```
    char* md5_C(char* dat);
    char* md5sum6_C(char* dat);
    char* md5file_C(const char* filename);
  ```
They are used as a syntax adaptor from C++ to C. 

##Usage
* To build `mainC` and `mainObjC`, which are executed in C and Object-C environment respectively. Just build by `make`. The lib `libmd5.a` is generated in folder `lib` through both build process.
* Clean build by `make clean`.
