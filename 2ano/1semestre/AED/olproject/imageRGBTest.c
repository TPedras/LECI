// imageRGBTest - A program that performs some operations on RGB images.
//
// This program is an example use of the imageRGB module,
// a programming project for the course AED, DETI / UA.PT
//
// You may freely use and modify this code, NO WARRANTY, blah blah,
// as long as you give proper credit to the original and subsequent authors.
//
// The AED Team <jmadeira@ua.pt, jmr@ua.pt, ...>
// 2025

#include <assert.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "error.h"
#include "imageRGB.h"
#include "instrumentation.h"

void printInstrumentation(const char* operation) {
  double elapsed_time = cpu_time() - InstrTime;
  printf("  [%s] PIXMEM accesses: %ld, Time: %.6f s\n", operation, InstrCount[0], elapsed_time);
}

int main(int argc, char* argv[]) {
  program_name = argv[0];
  if (argc != 1) {
    error(1, 0, "Usage: imageRGBTest");
  }

  ImageInit();

  printTestHeader("ImageCopy and ImageIsEqual");

  Image img1 = ImageCreateChess(100, 100, 10, 0x000000);
  printf("  Created chess image 100x100\n");

  InstrReset();
  Image img1_copy = ImageCopy(img1);
  printInstrumentation("ImageCopy");
  printf("  Copy created successfully\n");

  InstrReset();
  int is_equal = ImageIsEqual(img1, img1_copy);
  printInstrumentation("ImageIsEqual");
  printf("  Images are %s\n", is_equal ? "EQUAL" : "DIFFERENT");

  Image img2 = ImageCreate(100, 100);
  InstrReset();
  int is_different = ImageIsEqual(img1, img2);
  printInstrumentation("ImageIsEqual (different)");
  printf("  Images are %s (expected: DIFFERENT)\n", is_different ? "EQUAL" : "DIFFERENT");

  ImageSavePBM(img1, "test_original.pbm");
  ImageSavePBM(img1_copy, "test_copy.pbm");

  printTestHeader("ImageRotate90CW");

  Image small_chess = ImageCreateChess(40, 60, 10, 0x000000);
  printf("  Created chess image 40x60 (WxH)\n");

  InstrReset();
  Image rotated_90 = ImageRotate90CW(small_chess);
  printInstrumentation("ImageRotate90CW");
  printf("  Original: %ux%u, Rotated: %ux%u\n",
         ImageWidth(small_chess), ImageHeight(small_chess),
         ImageWidth(rotated_90), ImageHeight(rotated_90));
  printf("  Expected rotated dimensions: 60x40\n");

  ImageSavePBM(small_chess, "test_original_40x60.pbm");
  ImageSavePBM(rotated_90, "test_rotated_90.pbm");

  printTestHeader("ImageRotate180CW");

  InstrReset();
  Image rotated_180 = ImageRotate180CW(small_chess);
  printInstrumentation("ImageRotate180CW");
  printf("  Original: %ux%u, Rotated: %ux%u\n",
         ImageWidth(small_chess), ImageHeight(small_chess),
         ImageWidth(rotated_180), ImageHeight(rotated_180));
  printf("  Expected rotated dimensions: 40x60 (same as original)\n");

  ImageSavePBM(rotated_180, "test_rotated_180.pbm");

  printTestHeader("ImageRegionFillingRecursive");

  Image fill_test = ImageCreate(50, 50);
  printf("  Created white image 50x50\n");

  InstrReset();
  int pixels_filled = ImageRegionFillingRecursive(fill_test, 25, 25, 1);
  printInstrumentation("RegionFillingRecursive");
  printf("  Pixels filled: %d (expected: 2500)\n", pixels_filled);

  ImageSavePBM(fill_test, "test_fill_recursive.pbm");

  printTestHeader("ImageRegionFillingWithSTACK");

  Image fill_test_stack = ImageCreate(50, 50);
  printf("  Created white image 50x50\n");

  InstrReset();
  pixels_filled = ImageRegionFillingWithSTACK(fill_test_stack, 25, 25, 1);
  printInstrumentation("RegionFillingWithSTACK");
  printf("  Pixels filled: %d (expected: 2500)\n", pixels_filled);

  ImageSavePBM(fill_test_stack, "test_fill_stack.pbm");

  printTestHeader("ImageRegionFillingWithQUEUE");

  Image fill_test_queue = ImageCreate(50, 50);
  printf("  Created white image 50x50\n");

  InstrReset();
  pixels_filled = ImageRegionFillingWithQUEUE(fill_test_queue, 25, 25, 1);
  printInstrumentation("RegionFillingWithQUEUE");
  printf("  Pixels filled: %d (expected: 2500)\n", pixels_filled);

  ImageSavePBM(fill_test_queue, "test_fill_queue.pbm");

  printTestHeader("ImageSegmentation (Recursive)");

  Image segment_img = ImageCreateChess(60, 60, 20, 0x000000);
  printf("  Created chess image 60x60 with squares of 20x20\n");

  InstrReset();
  int num_regions = ImageSegmentation(segment_img, ImageRegionFillingRecursive);
  printInstrumentation("Segmentation (Recursive)");
  printf("  Number of regions found: %d\n", num_regions);
  printf("  Number of colors in LUT: %u\n", ImageColors(segment_img));

  ImageSavePPM(segment_img, "test_segmentation_recursive.ppm");

  printTestHeader("ImageSegmentation (STACK)");

  Image segment_img_stack = ImageCreateChess(60, 60, 20, 0x000000);
  printf("  Created chess image 60x60 with squares of 20x20\n");

  InstrReset();
  num_regions = ImageSegmentation(segment_img_stack, ImageRegionFillingWithSTACK);
  printInstrumentation("Segmentation (STACK)");
  printf("  Number of regions found: %d\n", num_regions);
  printf("  Number of colors in LUT: %u\n", ImageColors(segment_img_stack));

  ImageSavePPM(segment_img_stack, "test_segmentation_stack.ppm");

  printTestHeader("ImageSegmentation (QUEUE)");

  Image segment_img_queue = ImageCreateChess(60, 60, 20, 0x000000);
  printf("  Created chess image 60x60 with squares of 20x20\n");

  InstrReset();
  num_regions = ImageSegmentation(segment_img_queue, ImageRegionFillingWithQUEUE);
  printInstrumentation("Segmentation (QUEUE)");
  printf("  Number of regions found: %d\n", num_regions);
  printf("  Number of colors in LUT: %u\n", ImageColors(segment_img_queue));

  ImageSavePPM(segment_img_queue, "test_segmentation_queue.ppm");

  printTestHeader("Real Images Test - feep.pbm");

  Image feep_pbm = ImageLoadPBM("img/feep.pbm");
  printf("  Loaded feep.pbm: %ux%u pixels\n", ImageWidth(feep_pbm), ImageHeight(feep_pbm));
  printf("  Number of colors: %u\n", ImageColors(feep_pbm));

  InstrReset();
  Image feep_rotated = ImageRotate90CW(feep_pbm);
  printInstrumentation("Rotate90CW on feep.pbm");
  printf("  Rotated dimensions: %ux%u\n", ImageWidth(feep_rotated), ImageHeight(feep_rotated));
  ImageSavePBM(feep_rotated, "test_feep_rotated.pbm");

  InstrReset();
  Image feep_copy = ImageCopy(feep_pbm);
  printInstrumentation("Copy feep.pbm");

  InstrReset();
  int feep_equal = ImageIsEqual(feep_pbm, feep_copy);
  printInstrumentation("IsEqual feep.pbm");
  printf("  Original vs Copy: %s\n", feep_equal ? "EQUAL" : "DIFFERENT");

  printTestHeader("Real Images Test - feep.ppm");

  Image feep_ppm = ImageLoadPPM("img/feep.ppm");
  printf("  Loaded feep.ppm: %ux%u pixels\n", ImageWidth(feep_ppm), ImageHeight(feep_ppm));
  printf("  Number of colors: %u\n", ImageColors(feep_ppm));

  InstrReset();
  Image feep_ppm_rotated = ImageRotate180CW(feep_ppm);
  printInstrumentation("Rotate180CW on feep.ppm");
  ImageSavePPM(feep_ppm_rotated, "test_feep_ppm_rotated.ppm");

  Image feep_ppm_copy_rec = ImageCopy(feep_ppm);
  InstrReset();
  int filled_rec = ImageRegionFillingRecursive(feep_ppm_copy_rec, 0, 0, 2);
  printInstrumentation("RegionFilling Recursive on feep.ppm");
  printf("  Pixels filled from (0,0): %d\n", filled_rec);

  Image feep_ppm_copy_stack = ImageCopy(feep_ppm);
  InstrReset();
  int filled_stack = ImageRegionFillingWithSTACK(feep_ppm_copy_stack, 0, 0, 2);
  printInstrumentation("RegionFilling STACK on feep.ppm");
  printf("  Pixels filled from (0,0): %d\n", filled_stack);

  Image feep_ppm_copy = ImageCopy(feep_ppm);
  InstrReset();
  int filled = ImageRegionFillingWithQUEUE(feep_ppm_copy, 0, 0, 2);
  printInstrumentation("RegionFilling QUEUE on feep.ppm");
  printf("  Pixels filled from (0,0): %d\n", filled);
  ImageSavePPM(feep_ppm_copy, "test_feep_filled.ppm");

  printTestHeader("Segmentation on loaded PBM");

  Image feep_segment_rec = ImageLoadPBM("img/feep.pbm");
  InstrReset();
  int regions_feep_rec = ImageSegmentation(feep_segment_rec, ImageRegionFillingRecursive);
  printInstrumentation("Segmentation Recursive on feep.pbm");
  printf("  Number of regions found: %d\n", regions_feep_rec);
  printf("  Number of colors in LUT: %u\n", ImageColors(feep_segment_rec));

  Image feep_segment_stack = ImageLoadPBM("img/feep.pbm");
  InstrReset();
  int regions_feep_stack = ImageSegmentation(feep_segment_stack, ImageRegionFillingWithSTACK);
  printInstrumentation("Segmentation STACK on feep.pbm");
  printf("  Number of regions found: %d\n", regions_feep_stack);
  printf("  Number of colors in LUT: %u\n", ImageColors(feep_segment_stack));

  Image feep_segment = ImageLoadPBM("img/feep.pbm");
  InstrReset();
  int regions_feep = ImageSegmentation(feep_segment, ImageRegionFillingWithQUEUE);
  printInstrumentation("Segmentation QUEUE on feep.pbm");
  printf("  Number of regions found: %d\n", regions_feep);
  printf("  Number of colors in LUT: %u\n", ImageColors(feep_segment));
  ImageSavePPM(feep_segment, "test_feep_segmented.ppm");

  printTestHeader("Maze image (maze.pbm)");

  Image maze = ImageLoadPBM("img/maze.pbm");
  printf("  Loaded maze.pbm: %u x %u pixels\n", ImageWidth(maze), ImageHeight(maze));
  printf("  Number of colors: %u\n", ImageColors(maze));

  Image maze_fill_rec = ImageLoadPBM("img/maze.pbm");
  InstrReset();
  int maze_filled_rec = ImageRegionFillingRecursive(maze_fill_rec, 1, 1, 2);
  printInstrumentation("RegionFilling Recursive on maze");
  printf("  Pixels filled: %d\n", maze_filled_rec);

  Image maze_fill_stack = ImageLoadPBM("img/maze.pbm");
  InstrReset();
  int maze_filled_stack = ImageRegionFillingWithSTACK(maze_fill_stack, 1, 1, 2);
  printInstrumentation("RegionFilling STACK on maze");
  printf("  Pixels filled: %d\n", maze_filled_stack);

  Image maze_fill_queue = ImageLoadPBM("img/maze.pbm");
  InstrReset();
  int maze_filled_queue = ImageRegionFillingWithQUEUE(maze_fill_queue, 1, 1, 2);
  printInstrumentation("RegionFilling QUEUE on maze");
  printf("  Pixels filled: %d\n", maze_filled_queue);

  Image maze_segment_rec = ImageLoadPBM("img/maze.pbm");
  InstrReset();
  int regions_maze_rec = ImageSegmentation(maze_segment_rec, ImageRegionFillingRecursive);
  printInstrumentation("Segmentation Recursive on maze.pbm");
  printf("  Number of regions found: %d\n", regions_maze_rec);
  printf("  Number of colors in LUT: %u\n", ImageColors(maze_segment_rec));

  Image maze_segment_stack = ImageLoadPBM("img/maze.pbm");
  InstrReset();
  int regions_maze_stack = ImageSegmentation(maze_segment_stack, ImageRegionFillingWithSTACK);
  printInstrumentation("Segmentation STACK on maze.pbm");
  printf("  Number of regions found: %d\n", regions_maze_stack);
  printf("  Number of colors in LUT: %u\n", ImageColors(maze_segment_stack));

  InstrReset();
  int regions_maze = ImageSegmentation(maze, ImageRegionFillingWithQUEUE);
  printInstrumentation("Segmentation QUEUE on maze.pbm");
  printf("  Number of regions found: %d\n", regions_maze);
  printf("  Number of colors in LUT after segmentation: %u\n", ImageColors(maze));
  ImageSavePPM(maze, "test_maze_segmented.ppm");

  Image maze_rotated = ImageRotate90CW(ImageLoadPBM("img/maze.pbm"));
  printf("  Rotated 90 CW: %u x %u pixels\n", ImageWidth(maze_rotated), ImageHeight(maze_rotated));
  ImageSavePBM(maze_rotated, "test_maze_rotated.pbm");

  ImageDestroy(&img1);
  ImageDestroy(&img1_copy);
  ImageDestroy(&img2);
  ImageDestroy(&small_chess);
  ImageDestroy(&rotated_90);
  ImageDestroy(&rotated_180);
  ImageDestroy(&fill_test);
  ImageDestroy(&fill_test_stack);
  ImageDestroy(&fill_test_queue);
  ImageDestroy(&segment_img);
  ImageDestroy(&segment_img_stack);
  ImageDestroy(&segment_img_queue);
  ImageDestroy(&feep_pbm);
  ImageDestroy(&feep_rotated);
  ImageDestroy(&feep_copy);
  ImageDestroy(&feep_ppm);
  ImageDestroy(&feep_ppm_rotated);
  ImageDestroy(&feep_ppm_copy_rec);
  ImageDestroy(&feep_ppm_copy_stack);
  ImageDestroy(&feep_ppm_copy);
  ImageDestroy(&feep_segment_rec);
  ImageDestroy(&feep_segment_stack);
  ImageDestroy(&feep_segment);
  ImageDestroy(&maze);
  ImageDestroy(&maze_fill_rec);
  ImageDestroy(&maze_fill_stack);
  ImageDestroy(&maze_fill_queue);
  ImageDestroy(&maze_segment_rec);
  ImageDestroy(&maze_segment_stack);
  ImageDestroy(&maze_rotated);

  printf("\nAll tests completed!\n");

  return 0;
}