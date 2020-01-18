#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
    char *turn_on_af = "echo 1 > /sys/module/ov5645_camera_mipi_v2/parameters/ov5645_af";
    char *turn_off_af = "echo 2 > /sys/module/ov5645_camera_mipi_v2/parameters/ov5645_af";
    
    system("echo 123");

    return 0;
}