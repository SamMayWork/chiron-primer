# Errors

The start scripts in this repository have been tested, but due to the variety of machine configurations it's more likely there are going to be errors. Below are some common problems and solutions.

---

- [Errors](ERRORS.md)
  - [Docker Daemon isn't running](#docker-daemon-isnt-running)
  - [Current user is not in the Docker-Users user group (Windows)](#current-user-is-not-in-the-docker-users-user-group-windows)
  - [I've installed the prereqs but the start script isn't working](#ive-installed-the-prereqs-but-the-start-script-isnt-working)
  - [The start script really isn't working (Linux/MacOS)](#the-start-script-really-isnt-working-linuxmacos)
  - [The start script really isn't working (Windows)](#the-start-script-really-isnt-working-windows)
  - [The container is broken, how do I get a new one?](#the-container-is-broken-how-do-i-get-a-new-one)
  - [Something else?](#something-else)

---

## Docker Daemon isn't running

If you see (Linux/MacOS):

```
Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?
```

Or (Windows):

```
error during connect: This error may indicate that the docker daemon is not running. <Continued...>
```

It is likely that Docker is not running your system, open Docker Desktop and check that the status shows that the engine is running. 

---

## Current user is not in the Docker-Users user group (Windows)

If Windows fails to start Docker due to an error indicating that the current user is not in the Docker-Users user group then [follow this guide](https://icij.gitbook.io/datashare/faq-errors/you-are-not-allowed-to-use-docker-you-must-be-in-the-docker-users-group-.-what-should-i-do) to add your current user to the user group for Docker.

---

## I've installed the prereqs but the start script isn't working

![Turnitoff](images/restart.jpeg)

If you've needed to install some new dependencies, try rebooting the machine or at least closing all terminal windows and reopening to get the leatest $PATH variables.

It's probably quicker just to reboot your system.

If it's still not working, take a look at the answers below.

---

## The start script really isn't working (Linux/MacOS)

The start script really only does a few things here, take the following steps manually and determine what's failing.

(Using Terminal)

- Download the container `docker pull ssmay0/chiron-rust-client`
- Create a temporary directory `mkdir -p /tmp/rust`
- Run the container `docker run -d -p 8080:8080 -v /tmp/rust:/host ssmay0/chiron-rust-client`
- Open the directory you created `/tmp/rust` in any text editor
- Open the URL `localhost:8080` in your browser

---


## The start script really isn't working (Windows)

The start script really only does a few things here, take the following steps manually and determine what's failing.

(Using Command Prompt, or Powershell, I don't judge.)

- Download the container `docker pull ssmay0/chiron-rust-client`
- Create a temporary directory `mkdir %TEMP%\rust`
- Run the container `docker run -d -p 8080:8080 -v %TEMP%\rust:/host ssmay0/chiron-rust-client`
- Open the directory you created `%TEMP%\rust` in any text editor
- Open the URL `localhost:8080` in your browser

---

## The container is broken, how do I get a new one?

If the container is somwhow in an unrecoverable state, run `docker container ls` from a terminal window somewhere on the system and make a note of ID of the container. For example:

```
CONTAINER ID   IMAGE                       COMMAND                  CREATED         STATUS      
46ffce9944a1   ssmay0/chiron-rust-client   "docker-entrypoint.s…"   2 minutes ago   Up 2 minutes
```

Here `46ffce9944a1` is our container.

Then run `docker kill 46ffce9944a1`. Re-running the start script should take care of bringing up a new one.

---

## Something else?

If you're really stuck and it's not working, check if any others have hit and resolved the same issue, or if Google has any suggestions. Otherwise feel free to reach out to Samuel May on the UoP Discord.

Thanks for giving this tool a go!