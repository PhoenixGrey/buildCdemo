#ifndef MD5_H
#define MD5_H

#define _CRT_SECURE_NO_WARNINGS

#ifdef __cplusplus
extern "C" {
#endif

/*
std::string md5(std::string dat);
std::string md5(const void* dat, size_t len);
std::string md5file(const char* filename);
std::string md5file(std::FILE* file);
std::string md5sum6(std::string dat);
std::string md5sum6(const void* dat, size_t len);
*/
char* md5_C(char* dat);
char* md5sum6_C(char* dat);
char* md5file_C(const char* filename);

#ifdef __cplusplus
}
#endif
#endif // end of MD5_H
