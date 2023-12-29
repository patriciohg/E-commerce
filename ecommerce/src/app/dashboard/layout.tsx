import Navbar from '@components/components/ui/Navbar'
import React from 'react'


function DashboardLayout({
    children,
  }: {
    children: React.ReactNode
  }) {
  return (
    <>
        <Navbar/>
        {children}
    </>
  )
}

export default DashboardLayout