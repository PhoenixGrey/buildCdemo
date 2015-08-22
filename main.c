#include "libinclude/md5.h"
#include <stdio.h>
#include <stdlib.h>

int main(int argc,char** argv){

  char *str = "Foo baz, testing.";

	// MD5 from c-string
  printf("md5sum: %s\n",  md5_C(str));

  // Short MD5 from c-string
  printf("md5sum6: %s\n", md5sum6_C(str));

  // MD5 from filename
  printf("md5file: %s\n", md5file_C("README.md"));

  return EXIT_SUCCESS;
}
