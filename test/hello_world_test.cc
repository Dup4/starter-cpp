#include "gtest/gtest.h"
#include "snapshot/snapshot.h"

#include "starter-cpp/hello_world.h"

class HelloWorldTest : public testing::Test {
protected:
    virtual void SetUp() override {}
};

TEST_F(HelloWorldTest, hello_world_test) {
    EXPECT_EQ(HelloWorld(), "Hello World");
}
