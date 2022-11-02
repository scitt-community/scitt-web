# How to Locally Build and Test the Website

These pages are currently built with [jekyll](https://jekyllrb.com/).

Following the great [video from Bill Raymond](https://www.youtube.com/watch?v=owHfKAbJ6_M), you can build, test, iterate locally, without having to install or manage the jekyll dependencies.

For detailed steps: [BillRaymond/my-jekyll-docker-website](https://github.com/BillRaymond/my-jekyll-docker-website)

## Theme

- [Jekyll Theme](https://jekyllthemes.io/theme/just-the-docs)
- [Just the Docs - Docs](https://just-the-docs.github.io/just-the-docs/)

## First Time Building

## Incremental Building

Once you've built the container, and initiated the local jekyll builid process, the following steps are what you need to start a session.

1. In Visual Studio Code, open the terminal window and type:
    ``` bash
    bundle exec jekyll serve --livereload
    ```

## Closing the container
It is a good practice to close the container when you are done coding as it will free up memomry and resources on your base operating system. You can do that directly inside Visual Studio Code. 
1. To close and exit the container, in Visual Studio Code, close it by typing `COMMAND+SHIFT+P`, then type `Close remote connection`, and press `return`

## Opening the container
If you are familiar with Visual Studio Code, you probably go to the file menu and open a folder. With containers, it is almost the same, but with slightly different steps.

1. To open and start the container, run Visual Studio Code, type `COMMAND+SHIFT+P`, type `Open Folder in container…`, and then press `return`
2. Select the folder containing your Jekyll/GitHub Pages code that contains a `dockerfile` and press `return`
3. If the container already exists on your computer, it should start immediately. If it does not exist, Visual Studio Code will create a new Docker image and container (and possibly a Docker volume)
4. Begin developing!
5. Don't forget you can see your changes in real time by running Jekyll with the following command in the Visual Studio Code terminal window:

```bash
bundle exec jekyll serve --livereload
```
