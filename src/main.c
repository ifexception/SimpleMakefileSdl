#include <stdio.h>

#include <SDL2/SDL.h>

int main(void) 
{
    if (SDL_Init(SDL_INIT_VIDEO) != 0) {
        fputs(SDL_GetError(), stderr);
        return 1;
    }

    SDL_Window *window = SDL_CreateWindow("Hello", SDL_WINDOWPOS_UNDEFINED, 
            SDL_WINDOWPOS_UNDEFINED, 640, 480, SDL_WINDOW_SHOWN);
    if (window == NULL) {
        fputs(SDL_GetError(), stderr);
        return 1;
    }

    SDL_Surface *surface = SDL_GetWindowSurface(window);
    SDL_FillRect(surface, NULL, SDL_MapRGB(surface->format, 0x1f, 0x7c, 0xac));
    SDL_UpdateWindowSurface(window);

    SDL_Delay(3000);
    SDL_DestroyWindow(window);
    SDL_Quit();

    return 0;
}