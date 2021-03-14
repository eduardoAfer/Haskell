{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_simpleFuctions (
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

bindir     = "/Users/eduardoaraujo/Google Drive/gitHub/Haskell/simpleFuctions/.stack-work/install/x86_64-osx/fb126ed78520bfd9a624043438ef2ffef19c229f71a8a85e9b8da7a0c85183bf/8.10.4/bin"
libdir     = "/Users/eduardoaraujo/Google Drive/gitHub/Haskell/simpleFuctions/.stack-work/install/x86_64-osx/fb126ed78520bfd9a624043438ef2ffef19c229f71a8a85e9b8da7a0c85183bf/8.10.4/lib/x86_64-osx-ghc-8.10.4/simpleFuctions-0.1.0.0-65gVC5qAvtz9ruHY40uMg0-simpleFuctions"
dynlibdir  = "/Users/eduardoaraujo/Google Drive/gitHub/Haskell/simpleFuctions/.stack-work/install/x86_64-osx/fb126ed78520bfd9a624043438ef2ffef19c229f71a8a85e9b8da7a0c85183bf/8.10.4/lib/x86_64-osx-ghc-8.10.4"
datadir    = "/Users/eduardoaraujo/Google Drive/gitHub/Haskell/simpleFuctions/.stack-work/install/x86_64-osx/fb126ed78520bfd9a624043438ef2ffef19c229f71a8a85e9b8da7a0c85183bf/8.10.4/share/x86_64-osx-ghc-8.10.4/simpleFuctions-0.1.0.0"
libexecdir = "/Users/eduardoaraujo/Google Drive/gitHub/Haskell/simpleFuctions/.stack-work/install/x86_64-osx/fb126ed78520bfd9a624043438ef2ffef19c229f71a8a85e9b8da7a0c85183bf/8.10.4/libexec/x86_64-osx-ghc-8.10.4/simpleFuctions-0.1.0.0"
sysconfdir = "/Users/eduardoaraujo/Google Drive/gitHub/Haskell/simpleFuctions/.stack-work/install/x86_64-osx/fb126ed78520bfd9a624043438ef2ffef19c229f71a8a85e9b8da7a0c85183bf/8.10.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "simpleFuctions_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "simpleFuctions_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "simpleFuctions_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "simpleFuctions_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "simpleFuctions_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "simpleFuctions_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
