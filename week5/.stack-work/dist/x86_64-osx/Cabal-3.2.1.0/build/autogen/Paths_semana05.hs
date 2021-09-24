{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_semana05 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Volumes/GoogleDrive-113371203763727647694/O meu disco/gitHub/Haskell/week5/.stack-work/install/x86_64-osx/e03d72b77e36b85421bb506cb5b5d30189907bc5854955490703c9679552fc5e/8.10.4/bin"
libdir     = "/Volumes/GoogleDrive-113371203763727647694/O meu disco/gitHub/Haskell/week5/.stack-work/install/x86_64-osx/e03d72b77e36b85421bb506cb5b5d30189907bc5854955490703c9679552fc5e/8.10.4/lib/x86_64-osx-ghc-8.10.4/semana05-0.1.0.0-1fSwBnv9EPGFku90EPPB03"
dynlibdir  = "/Volumes/GoogleDrive-113371203763727647694/O meu disco/gitHub/Haskell/week5/.stack-work/install/x86_64-osx/e03d72b77e36b85421bb506cb5b5d30189907bc5854955490703c9679552fc5e/8.10.4/lib/x86_64-osx-ghc-8.10.4"
datadir    = "/Volumes/GoogleDrive-113371203763727647694/O meu disco/gitHub/Haskell/week5/.stack-work/install/x86_64-osx/e03d72b77e36b85421bb506cb5b5d30189907bc5854955490703c9679552fc5e/8.10.4/share/x86_64-osx-ghc-8.10.4/semana05-0.1.0.0"
libexecdir = "/Volumes/GoogleDrive-113371203763727647694/O meu disco/gitHub/Haskell/week5/.stack-work/install/x86_64-osx/e03d72b77e36b85421bb506cb5b5d30189907bc5854955490703c9679552fc5e/8.10.4/libexec/x86_64-osx-ghc-8.10.4/semana05-0.1.0.0"
sysconfdir = "/Volumes/GoogleDrive-113371203763727647694/O meu disco/gitHub/Haskell/week5/.stack-work/install/x86_64-osx/e03d72b77e36b85421bb506cb5b5d30189907bc5854955490703c9679552fc5e/8.10.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "semana05_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "semana05_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "semana05_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "semana05_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "semana05_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "semana05_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
