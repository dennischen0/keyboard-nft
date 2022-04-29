import { ethers } from "ethers";

import abi from "../utils/Keyboards.json"

const contractAddress = '0xf159B39f3CF85bF608D163691d8b5ea00bEaCEFc';
const contractABI = abi.abi;

export default function getKeyboardsContract(ethereum) {
  if(ethereum) {
    const provider = new ethers.providers.Web3Provider(ethereum);
    const signer = provider.getSigner();
    return new ethers.Contract(contractAddress, contractABI, signer);
  } else {
    return undefined;
  }
}
