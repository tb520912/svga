export interface TextMap {
  text: string
  size?: Length
  color?: string
  offset?: TextOffset
  family?: string
  style?: string
}
export interface TextOffset {
  x: number
  y: number
}