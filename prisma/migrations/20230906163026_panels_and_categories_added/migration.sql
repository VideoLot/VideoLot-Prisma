-- CreateEnum
CREATE TYPE "PanelType" AS ENUM ('Root', 'Horizontal', 'Grid');

-- CreateTable
CREATE TABLE "Panel" (
    "id" TEXT NOT NULL,
    "type" "PanelType" NOT NULL,
    "title" TEXT,
    "content" JSONB NOT NULL,
    "path" TEXT,
    "version" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    CONSTRAINT "Panel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Category" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_CategoryToVideoData" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_CategoryToVideoData_AB_unique" ON "_CategoryToVideoData"("A", "B");

-- CreateIndex
CREATE INDEX "_CategoryToVideoData_B_index" ON "_CategoryToVideoData"("B");

-- AddForeignKey
ALTER TABLE "_CategoryToVideoData" ADD CONSTRAINT "_CategoryToVideoData_A_fkey" FOREIGN KEY ("A") REFERENCES "Category"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CategoryToVideoData" ADD CONSTRAINT "_CategoryToVideoData_B_fkey" FOREIGN KEY ("B") REFERENCES "VideoData"("id") ON DELETE CASCADE ON UPDATE CASCADE;
