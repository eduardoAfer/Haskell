{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_ficha7 (
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

bindir     = "/Users/eduardoaraujo/Google Drive/gitHub/Haskell/ficha7/.stack-work/install/x86_64-osx/a4a1e1e3aa865af5f29a4fa952333577c561900e97095d1143d5ebf74a1c3ca0/8.10.4/bin"
libdir     = "/Users/eduardoaraujo/Google Drive/gitHub/Haskell/ficha7/.stack-work/install/x86_64-osx/a4a1e1e3aa865af5f29a4fa952333577c561900e97095d1143d5ebf74a1c3ca0/8.10.4/lib/x86_64-osx-ghc-8.10.4/ficha7-0.1.0.0-BZnhXPT4XoI9grL6rlg5UO-ficha7"
dynlibdir  = "/Users/eduardoaraujo/Google Drive/gitHub/Haskell/ficha7/.stack-work/install/x86_64-osx/a4a1e1e3aa865af5f29a4fa952333577c561900e97095d1143d5ebf74a1c3ca0/8.10.4/lib/x86_64-osx-ghc-8.10.4"
datadir    = "/Users/eduardoaraujo/Google Drive/gitHub/Haskell/ficha7/.stack-work/install/x86_64-osx/a4a1e1e3aa865af5f29a4fa952333577c561900e97095d1143d5ebf74a1c3ca0/8.10.4/share/x86_64-osx-ghc-8.10.4/ficha7-0.1.0.0"
libexecdir = "/Users/eduardoaraujo/Google Drive/gitHub/Haskell/ficha7/.stack-work/install/x86_64-osx/a4a1e1e3aa865af5f29a4fa952333577c561900e97095d1143d5ebf74a1c3ca0/8.10.4/libexec/x86_64-osx-ghc-8.10.4/ficha7-0.1.0.0"
sysconfdir = "/Users/eduardoaraujo/Google Drive/gitHub/Haskell/ficha7/.stack-work/install/x86_64-osx/a4a1e1e3aa865af5f29a4fa952333577c561900e97095d1143d5ebf74a1c3ca0/8.10.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "ficha7_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "ficha7_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "ficha7_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "ficha7_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "ficha7_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "ficha7_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
