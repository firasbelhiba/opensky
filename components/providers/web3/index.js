const {
  createContext,
  useContext,
  useEffect,
  useState,
  useMemo,
} = require('react')

import detectEthereumProvider from '@metamask/detect-provider'
import { loadContract } from 'utils/loadContract'
import Web3 from 'web3'
