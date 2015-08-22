#import "libinclude/md5.h"
#import <Foundation/Foundation.h>

int main(int argc,char** argv){

  char *str = "Foo baz, testing.";

	// MD5 from c-string
  NSLog(@"md5sum: %s\n",  md5_C(str));


  // Short MD5 from c-string
  NSLog(@"md5sum6: %s\n", md5sum6_C(str));


  // MD5 from filename
  NSLog(@"md5file: %s\n", md5file_C("README.md"));

  return EXIT_SUCCESS;
}
