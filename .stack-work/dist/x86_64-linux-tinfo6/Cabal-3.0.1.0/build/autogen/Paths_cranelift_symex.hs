{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_cranelift_symex (
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

bindir     = "/home/dthien/Documents/cranelift-symex/.stack-work/install/x86_64-linux-tinfo6/44c556e06b2f123770d54352abe5bcd9b5a7ef0ad099087aa7b6f28fb5414e79/8.8.3/bin"
libdir     = "/home/dthien/Documents/cranelift-symex/.stack-work/install/x86_64-linux-tinfo6/44c556e06b2f123770d54352abe5bcd9b5a7ef0ad099087aa7b6f28fb5414e79/8.8.3/lib/x86_64-linux-ghc-8.8.3/cranelift-symex-0.1.0.0-AdbwowVI31t33gCxfH1the"
dynlibdir  = "/home/dthien/Documents/cranelift-symex/.stack-work/install/x86_64-linux-tinfo6/44c556e06b2f123770d54352abe5bcd9b5a7ef0ad099087aa7b6f28fb5414e79/8.8.3/lib/x86_64-linux-ghc-8.8.3"
datadir    = "/home/dthien/Documents/cranelift-symex/.stack-work/install/x86_64-linux-tinfo6/44c556e06b2f123770d54352abe5bcd9b5a7ef0ad099087aa7b6f28fb5414e79/8.8.3/share/x86_64-linux-ghc-8.8.3/cranelift-symex-0.1.0.0"
libexecdir = "/home/dthien/Documents/cranelift-symex/.stack-work/install/x86_64-linux-tinfo6/44c556e06b2f123770d54352abe5bcd9b5a7ef0ad099087aa7b6f28fb5414e79/8.8.3/libexec/x86_64-linux-ghc-8.8.3/cranelift-symex-0.1.0.0"
sysconfdir = "/home/dthien/Documents/cranelift-symex/.stack-work/install/x86_64-linux-tinfo6/44c556e06b2f123770d54352abe5bcd9b5a7ef0ad099087aa7b6f28fb5414e79/8.8.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "cranelift_symex_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "cranelift_symex_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "cranelift_symex_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "cranelift_symex_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "cranelift_symex_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "cranelift_symex_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
