{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_week3 (
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

bindir     = "/Volumes/GoogleDrive-113371203763727647694/O meu disco/gitHub/Haskell/week3/.stack-work/install/x86_64-osx/b34d1e154cf9eabe4bbf1ab03f02472959ef7762b93882956499fa8a10f3d33f/8.10.7/bin"
libdir     = "/Volumes/GoogleDrive-113371203763727647694/O meu disco/gitHub/Haskell/week3/.stack-work/install/x86_64-osx/b34d1e154cf9eabe4bbf1ab03f02472959ef7762b93882956499fa8a10f3d33f/8.10.7/lib/x86_64-osx-ghc-8.10.7/week3-0.1.0.0-A6dp7HcKTv46EnPeLfbvRB-week3"
dynlibdir  = "/Volumes/GoogleDrive-113371203763727647694/O meu disco/gitHub/Haskell/week3/.stack-work/install/x86_64-osx/b34d1e154cf9eabe4bbf1ab03f02472959ef7762b93882956499fa8a10f3d33f/8.10.7/lib/x86_64-osx-ghc-8.10.7"
datadir    = "/Volumes/GoogleDrive-113371203763727647694/O meu disco/gitHub/Haskell/week3/.stack-work/install/x86_64-osx/b34d1e154cf9eabe4bbf1ab03f02472959ef7762b93882956499fa8a10f3d33f/8.10.7/share/x86_64-osx-ghc-8.10.7/week3-0.1.0.0"
libexecdir = "/Volumes/GoogleDrive-113371203763727647694/O meu disco/gitHub/Haskell/week3/.stack-work/install/x86_64-osx/b34d1e154cf9eabe4bbf1ab03f02472959ef7762b93882956499fa8a10f3d33f/8.10.7/libexec/x86_64-osx-ghc-8.10.7/week3-0.1.0.0"
sysconfdir = "/Volumes/GoogleDrive-113371203763727647694/O meu disco/gitHub/Haskell/week3/.stack-work/install/x86_64-osx/b34d1e154cf9eabe4bbf1ab03f02472959ef7762b93882956499fa8a10f3d33f/8.10.7/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "week3_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "week3_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "week3_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "week3_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "week3_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "week3_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
