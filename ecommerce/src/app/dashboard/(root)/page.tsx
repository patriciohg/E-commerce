import { UserButton, auth, redirectToSignIn } from '@clerk/nextjs'
import { User } from '@clerk/nextjs/server'
import { redirect } from 'next/dist/server/api-utils';
import React from 'react'

function Page() {
    const{ userId } = auth();
    
    if(!userId)
        return redirectToSignIn();

  return (
    <div>
        Hola  mundo
    </div>
  )
}

export default Page