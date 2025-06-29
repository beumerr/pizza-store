import React from "react"

const baseStyle: React.CSSProperties = {
  width: 20,
  height: 20,
}

export const InfoIcon: React.FC = () => (
  <svg style={baseStyle} viewBox="0 0 24 24" fill="#2196f3">
    <circle cx="12" cy="12" r="10" />
    <text x="12" y="16" textAnchor="middle" fontSize="12" fill="white">
      i
    </text>
  </svg>
)

export const SuccessIcon: React.FC = () => (
  <svg style={baseStyle} viewBox="0 0 24 24" fill="#4caf50">
    <circle cx="12" cy="12" r="10" />
    <polyline points="8,12 11,15 16,9" fill="none" stroke="white" strokeWidth="2" />
  </svg>
)

export const ErrorIcon: React.FC = () => (
  <svg style={baseStyle} viewBox="0 0 24 24" fill="#f44336">
    <circle cx="12" cy="12" r="10" />
    <line x1="8" y1="8" x2="16" y2="16" stroke="white" strokeWidth="2" />
    <line x1="16" y1="8" x2="8" y2="16" stroke="white" strokeWidth="2" />
  </svg>
)

export const WarningIcon: React.FC = () => (
  <svg style={baseStyle} viewBox="0 0 24 24" fill="#ff9800">
    <circle cx="12" cy="12" r="10" />
    <line x1="12" y1="7" x2="12" y2="13" stroke="white" strokeWidth="2" />
    <circle cx="12" cy="17" r="1" fill="white" />
  </svg>
)
