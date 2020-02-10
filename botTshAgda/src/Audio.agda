
module Audio where

open import Agda.Builtin.IO
open import Agda.Builtin.Unit
open import Agda.Builtin.String

open import Data.Nat
open import Data.Fin
open import Data.Integer using (ℤ ; +_)
                         renaming (_+_ to _⊕_)

open import Polymorphic.Temporal.Media

{-# FOREIGN GHC import Agda2Csound #-}

data Duration : Set where
  q : ℤ → ℤ → Duration

{-# COMPILE GHC Duration = data Duration (Q) #-}

data SampleAudio : Set where
  play : String → Duration → ℤ → SampleAudio
  rest : Duration → SampleAudio
  _++_ : SampleAudio → SampleAudio → SampleAudio
  _==_ : SampleAudio → SampleAudio → SampleAudio

{-# COMPILE GHC SampleAudio = data AgdaMedia ( Play | Wait | SeqM | SimM ) #-}

volume : (Fin 16) → ℤ
volume f = + (toℕ f)

postulate
  runMedia : ℤ → SampleAudio → IO ⊤
{-# COMPILE GHC runMedia = runAgdaMedia  #-}
