#include <cstdio>
#include <cuda.h>
#include <cuda_runtime.h>
#include <stdio.h>

#define THREADS_PER_BLOCK 256

int main(){
    const int N=32*1024*1024;
    float *input=(float*)malloc(N*sizeof(float));
    float *d_input;
    cudaMalloc((void**)&d_input,N*sizeof(float));

    int  block_num=N / THREADS_PER_BLOCK;

    float *output=(float *)malloc(N/THREADS_PER_BLOCK*sizeof(float));
    float *d_output;
    cudaMalloc((void**)&d_output,N/THREADS_PER_BLOCK*sizeof(float));

    float* result=(float*)malloc(N/THREADS_PER_BLOCK*sizeof(float));

    for(int i=0;i<N;i++){
        input[i]=2.0*(float)drand48()-1.0;
    }

    for(int i=0;i<block_num;i++){
        float sum=0.0;
        for(int j=0;j<THREADS_PER_BLOCK;j++){
            sum+=input[i*THREADS_PER_BLOCK+j];
        }
        result[i]=sum;
    }

    cudaMemcpy(d_input,input,N*sizeof(float),cudaMemcpyHostToDevice);

    dim3 Grid(block_num,1,1);
    dim3 Block(THREADS_PER_BLOCK,1,1);

    // TODO

    free(input);
    free(output);
    free(result);
    cudaFree(d_input);
    cudaFree(d_output);
    cudaDeviceReset();
    printf("success\n");
    return 0;
}