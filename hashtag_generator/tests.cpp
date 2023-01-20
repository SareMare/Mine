#include "gtest/gtest.h"

#include "oop2.h"

TEST(HashtagTest, WordsInput)
{
    EXPECT_EQ(stringToHashtag("hello world"),"#HelloWorld");
    EXPECT_EQ(stringToHashtag("   hello world"),"#HelloWorld");
    EXPECT_EQ(stringToHashtag("   hello world   "),"#HelloWorld");
    EXPECT_EQ(stringToHashtag("hello    world"),"#HelloWorld");
    EXPECT_EQ(stringToHashtag("helloworld"),"#Helloworld");
}
