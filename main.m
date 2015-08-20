//#import "libinclude/encryption.h"
#import "libinclude/md5.h"
#import <Foundation/Foundation.h>
/*
int main() {
  NSLog(@"Math Questions ......\n");
  NSLog(@"Square of 20 is %d.\n", square_c(20));
  return 0;
}
*/
int main(int argc,char** argv){

  char cstring[] = "Foo baz, testing.";
  std::string str = cstring;

  /* MD5 from std::string */
  NSLOG("md5sum: %s\n",  md5(  str ).c_str());

  /* MD5 from c-string */
  NSLOG("md5sum: %s\n",  md5(  cstring ).c_str());

  /* Short MD5 from c-string */
  NSLOG("md5sum6: %s\n", md5sum6( cstring ).c_str());

  /* Short MD5 from std::string */
  NSLOG("md5sum6: %s\n", md5sum6( str ).c_str());

  /* MD5 from filename */
  NSLOG("md5file: %s\n", md5file("README.md").c_str());

  /* MD5 from opened file */
/*
  std::FILE* file = std::fopen("README.md", "rb");
  NSLOG("md5file: %s\n", md5file(file).c_str());
  std::fclose(file);
*/
  /* we're done */
  return EXIT_SUCCESS;
}
