{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_preciosismos (
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

bindir     = "/Users/eduardoaraujo/Google Drive/gitHub/Haskell/preciosismos/.stack-work/install/x86_64-osx/85c46bdef21f1e36cf0d59045e0aaaf22560d75939fa03d9ea3d25e59fbfeb6d/8.10.4/bin"
libdir     = "/Users/eduardoaraujo/Google Drive/gitHub/Haskell/preciosismos/.stack-work/install/x86_64-osx/85c46bdef21f1e36cf0d59045e0aaaf22560d75939fa03d9ea3d25e59fbfeb6d/8.10.4/lib/x86_64-osx-ghc-8.10.4/preciosismos-0.1.0.0-InUVPtjUYg0HFahG9NZDwb-preciosismos"
dynlibdir  = "/Users/eduardoaraujo/Google Drive/gitHub/Haskell/preciosismos/.stack-work/install/x86_64-osx/85c46bdef21f1e36cf0d59045e0aaaf22560d75939fa03d9ea3d25e59fbfeb6d/8.10.4/lib/x86_64-osx-ghc-8.10.4"
datadir    = "/Users/eduardoaraujo/Google Drive/gitHub/Haskell/preciosismos/.stack-work/install/x86_64-osx/85c46bdef21f1e36cf0d59045e0aaaf22560d75939fa03d9ea3d25e59fbfeb6d/8.10.4/share/x86_64-osx-ghc-8.10.4/preciosismos-0.1.0.0"
libexecdir = "/Users/eduardoaraujo/Google Drive/gitHub/Haskell/preciosismos/.stack-work/install/x86_64-osx/85c46bdef21f1e36cf0d59045e0aaaf22560d75939fa03d9ea3d25e59fbfeb6d/8.10.4/libexec/x86_64-osx-ghc-8.10.4/preciosismos-0.1.0.0"
sysconfdir = "/Users/eduardoaraujo/Google Drive/gitHub/Haskell/preciosismos/.stack-work/install/x86_64-osx/85c46bdef21f1e36cf0d59045e0aaaf22560d75939fa03d9ea3d25e59fbfeb6d/8.10.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "preciosismos_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "preciosismos_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "preciosismos_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "preciosismos_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "preciosismos_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "preciosismos_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
