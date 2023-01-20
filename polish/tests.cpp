#include "gtest/gtest.h"

#include "oop6.h"

TEST(HashtagTest, WordsInput)
{
    EXPECT_EQ(convert(),102);//8 9 + 1 7 - *
    EXPECT_EQ(convert(),70); //5 5 + 4 3 + *
    EXPECT_EQ(convert(),140);//9 5 + 2 8 + *
    EXPECT_EQ(convert(),528);//10 5 + 7 + 20 1 + 3 + *

}